terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {

    # Datadog Provider
    # https://registry.terraform.io/providers/DataDog/datadog/latest/docs

    datadog = {
      source = "datadog/datadog"
    }

    # Google Cloud Platform Provider
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Datadog Google Cloud Platform Integration Module (osinfra.io)
# https://github.com/osinfra-io/terraform-datadog-google-integration

# module "datadog" {
#   source = "github.com/osinfra-io/terraform-datadog-google-integration//global?ref=v0.1.0"

#   api_key         = var.datadog_api_key
#   is_cspm_enabled = true
#   project         = module.project.project_id
# }

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "project" {
  source = "github.com/osinfra-io/terraform-google-project//global?ref=v0.1.5"

  billing_account                 = var.billing_account
  cis_2_2_logging_sink_project_id = var.cis_2_2_logging_sink_project_id
  cost_center                     = "x001"
  description                     = "identity"
  environment                     = var.environment
  folder_id                       = var.folder_id

  labels = {
    "environment" = var.environment,
    "description" = "identity",
    "platform"    = "google-cloud-landing-zone",
  }

  prefix = "plt-lz"

  services = [
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "monitoring.googleapis.com",
    "sts.googleapis.com"
  ]
}

# To avoid subject collisions, we are using a single provider per workload identity pool.
# https://cloud.google.com/iam/docs/best-practices-for-using-workload-identity-federation#avoid-subject-collisions

# IAM Workload Identity Pool Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool

resource "google_iam_workload_identity_pool" "this" {
  for_each = local.workload_identity

  description               = "Workload Identity Pool for ${each.value.display_name}"
  disabled                  = lookup(each.value, "disabled", false)
  display_name              = each.value.display_name
  project                   = module.project.project_id
  workload_identity_pool_id = each.key
}

# IAM Workload Identity Pool Provider Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider

resource "google_iam_workload_identity_pool_provider" "this" {
  for_each = local.workload_identity

  attribute_condition                = each.value.attribute_condition
  attribute_mapping                  = each.value.attribute_mapping
  description                        = "Workload Identity Pool Provider for ${each.value.display_name}"
  disabled                           = lookup(each.value, "disabled", false)
  display_name                       = "${each.value.display_name} OIDC"
  project                            = module.project.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.this[each.key].workload_identity_pool_id
  workload_identity_pool_provider_id = "${each.key}-oidc"

  oidc {
    allowed_audiences = lookup(each.value, "allowed_audiences", [])
    issuer_uri        = each.value.issuer_uri
  }
}
