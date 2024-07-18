# Terraform Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.38.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_datadog"></a> [datadog](#module\_datadog) | github.com/osinfra-io/terraform-datadog-google-integration//global | v0.1.6 |
| <a name="module_project"></a> [project](#module\_project) | github.com/osinfra-io/terraform-google-project//global | v0.2.2 |

## Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The alphanumeric ID of the billing account this project belongs to | `string` | `"01C550-A2C86B-B8F16B"` | no |
| <a name="input_cis_2_2_logging_sink_project_id"></a> [cis\_2\_2\_logging\_sink\_project\_id](#input\_cis\_2\_2\_logging\_sink\_project\_id) | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | Datadog API key | `string` | n/a | yes |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | Datadog APP key | `string` | n/a | yes |
| <a name="input_enable_datadog"></a> [enable\_datadog](#input\_enable\_datadog) | Enable Datadog integration | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production) | `string` | `"sb"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The project ID |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | The project number |
| <a name="output_workload_identity_pool_names"></a> [workload\_identity\_pool\_names](#output\_workload\_identity\_pool\_names) | The workload identity pool names |
| <a name="output_workload_identity_pool_provider_names"></a> [workload\_identity\_pool\_provider\_names](#output\_workload\_identity\_pool\_provider\_names) | The workload identity pool provider names |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
