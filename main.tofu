terraform {
  # State and Plan Encryption
  # https://opentofu.org/docs/language/state/encryption

  # The commented out sections below demonstrate how to configure
  # fallback encryption methods for state and plan files for bootstrapping.

  encryption {
    method "unencrypted" "migrate" {}

    key_provider "gcp_kms" "default" {
      kms_encryption_key = var.state_kms_encryption_key
      key_length         = 32
    }

    method "aes_gcm" "default" {
      keys = key_provider.gcp_kms.default
    }

    plan {
      method = method.aes_gcm.default
      # enforced = true

      fallback {
        method = method.unencrypted.migrate
      }
    }

    state {
      method = method.aes_gcm.default
      # enforced = true

      fallback {
        method = method.unencrypted.migrate
      }
    }
  }

  # Requiring Providers
  # https://opentofu.org/docs/language/providers/requirements#requiring-providers

  required_providers {

    # Datadog Provider
    # https://search.opentofu.org/provider/DataDog/datadog/latest/docs

    datadog = {
      source = "datadog/datadog"
    }

    # Google Cloud Platform Provider
    # https://search.opentofu.org/provider/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Google Cloud Provider
# https://search.opentofu.org/provider/hashicorp/google/latest/docs

# This is only needed during bootstrapping.

# provider "google" {
#   billing_project       = var.billing_project
#   user_project_override = true
# }

# Datadog Google Cloud Platform Integration Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-datadog-google-integration

module "datadog" {
  source = "github.com/osinfra-io/opentofu-datadog-google-integration?ref=v0.3.6"
  count  = var.datadog_enable ? 1 : 0

  api_key                            = var.datadog_api_key
  is_cspm_enabled                    = true
  is_security_command_center_enabled = true
  labels                             = module.helpers.labels
  project                            = module.project.id
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/opentofu-google-project

module "project" {
  source = "github.com/osinfra-io/opentofu-google-project?ref=v0.4.6"

  billing_account                 = var.project_billing_account
  cis_2_2_logging_sink_project_id = var.project_cis_2_2_logging_sink_project_id
  description                     = "identity"
  folder_id                       = var.project_folder_id
  labels                          = module.helpers.labels
  prefix                          = "plt-lz"

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
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/iam_workload_identity_pool

resource "google_iam_workload_identity_pool" "this" {
  for_each = local.workload_identity

  description               = "Workload Identity Pool for ${each.value.display_name}"
  disabled                  = lookup(each.value, "disabled", false)
  display_name              = each.value.display_name
  project                   = module.project.id
  workload_identity_pool_id = each.key
}

# IAM Workload Identity Pool Provider Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider

resource "google_iam_workload_identity_pool_provider" "this" {
  for_each = local.workload_identity

  attribute_condition                = each.value.attribute_condition
  attribute_mapping                  = each.value.attribute_mapping
  description                        = "Workload Identity Pool Provider for ${each.value.display_name}"
  disabled                           = lookup(each.value, "disabled", false)
  display_name                       = "${each.value.display_name} OIDC"
  project                            = module.project.id
  workload_identity_pool_id          = google_iam_workload_identity_pool.this[each.key].workload_identity_pool_id
  workload_identity_pool_provider_id = "${each.key}-oidc"

  oidc {
    allowed_audiences = lookup(each.value, "allowed_audiences", [])
    issuer_uri        = each.value.issuer_uri
  }
}
