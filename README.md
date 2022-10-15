# Google Cloud Platform - Workload Identity

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-workload-identity/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml)

**[Bridgecrew](https://www.bridgecrew.cloud/projects?types=Passed&repository=osinfra-io%2Fgoogle-cloud-workload-identity&branch=main):**

[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/osinfra-io/google-cloud-workload-identity/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=osinfra-io%2Fgoogle-cloud-workload-identity&benchmark=CIS+GCP+V1.1)

Traditionally, applications running outside Google Cloud have used service account keys to access Google Cloud resources. Service account keys are powerful credentials, and can represent a security risk if they are not managed correctly.

With [workload identity federation](https://cloud.google.com/iam/docs/workload-identity-federation), you can use Identity and Access Management (IAM) to grant external identities IAM roles, including the ability to impersonate service accounts. This lets you access resources directly, using a [short-lived access token](https://cloud.google.com/iam/docs/create-short-lived-credentials-direct), and eliminates the maintenance and security burden associated with service account keys.

[Best practices for using workload identity federation](https://cloud.google.com/iam/docs/best-practices-for-using-workload-identity-federation)

## Terraform Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider_google) | 4.40.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module_project) | git@github.com:osinfra-io/terraform-google-project | n/a |

### Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing_account](#input_billing_account) | The alphanumeric ID of the billing account this project belongs to | `string` | n/a | yes |
| <a name="input_cis_2_2_logging_sink_project_id"></a> [cis_2_2_logging_sink_project_id](#input_cis_2_2_logging_sink_project_id) | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder_id](#input_folder_id) | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input_env) | The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production) | `string` | `"sb"` | no |
| <a name="input_workload_identity"></a> [workload_identity](#input_workload_identity) | This map defines resources for workload identity pools and providers | `map(any)` | `{}` | no |

### Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
