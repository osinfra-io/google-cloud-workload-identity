# <img align="left" width="45" height="45" src="https://user-images.githubusercontent.com/1610100/196006051-0ce38983-ffc9-4d5d-bf41-1da0b5e0fd6e.png">Google Cloud Platform - Workload Identity

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-workload-identity/actions):**

[![Infracost](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/infracost.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/infracost.yml) [![Dependabot](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml)

**[Bridgecrew](https://www.bridgecrew.cloud/projects?types=Passed&repository=osinfra-io%2Fgoogle-cloud-workload-identity&branch=main):**

[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/osinfra-io/google-cloud-workload-identity/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=osinfra-io%2Fgoogle-cloud-workload-identity&benchmark=INFRASTRUCTURE+SECURITY) [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/osinfra-io/google-cloud-workload-identity/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=osinfra-io%2Fgoogle-cloud-workload-identity&benchmark=CIS+GCP+V1.1)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/cdfd3281-bb1c-425b-aad0-1a80a1512502/branch/62383c83-9bf4-4fa9-8b48-7b96987f6fc1)](https://dashboard.infracost.io/org/osinfra-io/repos/cdfd3281-bb1c-425b-aad0-1a80a1512502)

Traditionally, applications running outside Google Cloud have used service account keys to access Google Cloud resources. Service account keys are powerful credentials, and can represent a security risk if they are not managed correctly.

With [workload identity federation](https://cloud.google.com/iam/docs/workload-identity-federation), you can use Identity and Access Management (IAM) to grant external identities IAM roles, including the ability to impersonate service accounts. This lets you access resources directly, using a [short-lived access token](https://cloud.google.com/iam/docs/create-short-lived-credentials-direct), and eliminates the maintenance and security burden associated with service account keys.

[Best practices for using workload identity federation](https://cloud.google.com/iam/docs/best-practices-for-using-workload-identity-federation).

This repository creates an identity project and workload identity federation resources that aligns with our [landing zone](https://cloud.google.com/architecture/landing-zones) design. A landing zone should be a prerequisite to deploying enterprise workloads in a cloud environment. It's intended for cloud system administrators, architects, and technical practitioners responsible for designing the resource hierarchy. As every organization is different, there is no single best approach for resource hierarchy; this is considered a sensible default that scales well and can be customized to meet the needs and requirements of your organization.

It's designed to be used with:

- [google-cloud-hierarchy](https://github.com/osinfra-io/google-cloud-hierarchy): Metaphorically speaking, the [Google Cloud resource hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy) resembles the file system found in traditional operating systems as a way of organizing and managing entities hierarchically.
- [google-cloud-audit-logging](https://github.com/osinfra-io/google-cloud-audit-logging): Google Cloud Platform (GCP) services write audit logs that record administrative activities and accesses within your Google Cloud Platform (GCP) resources. [Audit logs](https://cloud.google.com/logging/docs/audit) help you answer "who did what, where, and when?" within your Google Cloud resources with the same level of transparency as in on-premises environments. Enabling audit logs helps your security, auditing, and compliance entities monitor Google Cloud data and systems for possible vulnerabilities or external data misuse.
- [google-cloud-terraform-backend](https://github.com/osinfra-io/google-cloud-terraform-backend): Terraform uses persisted state data to keep track of the resources it manages. Most non-trivial Terraform configurations use a backend to store state remotely. This lets multiple people access the state data and work together on that collection of infrastructure resources.

## Terraform Documentation

[**Global Infrastructure**](global/infra/README.md)
