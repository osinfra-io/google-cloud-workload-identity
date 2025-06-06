# <img align="left" width="45" height="45" src="https://user-images.githubusercontent.com/1610100/196006051-0ce38983-ffc9-4d5d-bf41-1da0b5e0fd6e.png">Google Cloud Platform - Workload Identity

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-workload-identity/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/cdfd3281-bb1c-425b-aad0-1a80a1512502/branch/62383c83-9bf4-4fa9-8b48-7b96987f6fc1)](https://dashboard.infracost.io/org/osinfra-io/repos/cdfd3281-bb1c-425b-aad0-1a80a1512502?tab=settings)

💵 Monthly estimates based on Infracost baseline costs.

## 📄 Repository Description

This repository configures [workload identity federation](https://cloud.google.com/iam/docs/workload-identity-federation) that aligns with our [Google Cloud landing zone platform](https://docs.osinfra.io/google-cloud-platform/landing-zone) design. A landing zone should be a prerequisite to deploying enterprise workloads in a cloud environment.

## 🏭 Platform Information

- Documentation: [docs.osinfra.io](https://docs.osinfra.io/product-guides/google-cloud-platform/landing-zone/google-cloud-workload-identity)
- Service Interfaces: [github.com](https://github.com/osinfra-io/google-cloud-workload-identity/issues/new/choose)

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a development environment [here](https://docs.osinfra.io/fundamentals/development-setup).

### 🛠️ Tools

- [checkov](https://github.com/bridgecrewio/checkov)
- [infracost](https://github.com/infracost/infracost)
- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [workload identity federation](https://cloud.google.com/iam/docs/workload-identity-federation)
- [best practices for using workload identity federation](https://cloud.google.com/iam/docs/best-practices-for-using-workload-identity-federation)
- [gitHub configuring openid connect in gcp](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-google-cloud-platform)

### 📓 Terraform Documentation

<!-- BEGIN_TF_DOCS -->
#### Providers

| Name | Version |
|------|---------|
| google | 6.14.1 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| datadog | github.com/osinfra-io/terraform-datadog-google-integration | v0.3.0 |
| helpers | github.com/osinfra-io/terraform-core-helpers//root | v0.1.2 |
| project | github.com/osinfra-io/terraform-google-project | v0.4.5 |

#### Resources

| Name | Type |
|------|------|
| [google_iam_workload_identity_pool.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| datadog\_api\_key | Datadog API key | `string` | n/a | yes |
| datadog\_app\_key | Datadog APP key | `string` | n/a | yes |
| datadog\_enable | Enable Datadog integration | `bool` | `false` | no |
| project\_billing\_account | The alphanumeric ID of the billing account this project belongs to | `string` | `"01C550-A2C86B-B8F16B"` | no |
| project\_cis\_2\_2\_logging\_sink\_project\_id | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| project\_folder\_id | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |

#### Outputs

| Name | Description |
|------|-------------|
| project\_id | The project ID |
| project\_number | The project number |
| workload\_identity\_pool\_names | The workload identity pool names |
| workload\_identity\_pool\_provider\_names | The workload identity pool provider names |
<!-- END_TF_DOCS -->
