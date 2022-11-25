# <img align="left" width="45" height="45" src="https://user-images.githubusercontent.com/1610100/196006051-0ce38983-ffc9-4d5d-bf41-1da0b5e0fd6e.png">Google Cloud Platform - Workload Identity

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-workload-identity/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-workload-identity/actions/workflows/dependabot.yml)

**[Bridgecrew](https://www.bridgecrew.cloud/projects?types=Passed&repository=osinfra-io%2Fgoogle-cloud-workload-identity&branch=main):**

[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/osinfra-io/google-cloud-workload-identity/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=osinfra-io%2Fgoogle-cloud-workload-identity&benchmark=INFRASTRUCTURE+SECURITY) [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/osinfra-io/google-cloud-workload-identity/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=osinfra-io%2Fgoogle-cloud-workload-identity&benchmark=CIS+GCP+V1.1)

Traditionally, applications running outside Google Cloud have used service account keys to access Google Cloud resources. Service account keys are powerful credentials, and can represent a security risk if they are not managed correctly.

With [workload identity federation](https://cloud.google.com/iam/docs/workload-identity-federation), you can use Identity and Access Management (IAM) to grant external identities IAM roles, including the ability to impersonate service accounts. This lets you access resources directly, using a [short-lived access token](https://cloud.google.com/iam/docs/create-short-lived-credentials-direct), and eliminates the maintenance and security burden associated with service account keys.

[Best practices for using workload identity federation](https://cloud.google.com/iam/docs/best-practices-for-using-workload-identity-federation).

## Terraform Documentation

[Global Infrastructure](global/README.md)
