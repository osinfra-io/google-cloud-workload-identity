terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# Google Provider
# https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "git@github.com:osinfra-io/terraform-google-project"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  env                             = var.env
  folder_id                       = var.folder_id

  labels = {
    "environment" = var.env,
    "system"      = "identity",
    "team"        = "shared"
  }

  prefix = "shared"
  system = "identity"
}

# To avoid subject collisions, we are using a shared map to create a single provider per workload identity pool.
# If you need to federate with multiple providers, create multiple workload identity pools, each using a single workload identity provider.
# https://cloud.google.com/iam/docs/best-practices-for-using-workload-identity-federation#avoid-subject-collisions

# IAM Workload Identity Pool Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool

resource "google_iam_workload_identity_pool" "this" {
  for_each = local.workload_identity

  description               = "Workload Identity Pool for ${each.key}"
  disabled                  = lookup(each.value, "disabled", false)
  display_name              = "${each.key}-wif-pool"
  project                   = module.project.project_id
  workload_identity_pool_id = "${each.key}-wif-pool"
}

# IAM Workload Identity Pool Provider Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider

resource "google_iam_workload_identity_pool_provider" "this" {
  for_each = local.workload_identity

  attribute_condition                = lookup(each.value, "attribute_condition", null)
  attribute_mapping                  = each.value.attribute_mapping
  description                        = "Workload Identity Pool Provider for ${each.key}"
  disabled                           = lookup(each.value, "disabled", false)
  display_name                       = "${each.key}-wif-provider"
  project                            = module.project.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.this[each.key].workload_identity_pool_id
  workload_identity_pool_provider_id = "${each.key}-wif-provider"

  oidc {
    allowed_audiences = lookup(each.value, "allowed_audiences", [])
    issuer_uri        = each.value.issuer_uri
  }
}

# Project Service Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service

resource "google_project_service" "this" {
  for_each = toset(
    [
      "cloudresourcemanager.googleapis.com",
      "iam.googleapis.com",
      "iamcredentials.googleapis.com",
      "stackdriver.googleapis.com",
      "sts.googleapis.com"
    ]
  )

  project = module.project.project_id
  service = each.key

  disable_on_destroy = false
}
