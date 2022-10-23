# Local Values
# https://www.terraform.io/language/values/locals

locals {

  workload_identity = {
    "github-actions" = {
      attribute_mapping = {
        "attribute.actor"      = "assertion.actor"
        "attribute.aud"        = "assertion.aud"
        "attribute.repository" = "assertion.repository"
        "google.subject"       = "assertion.sub"
      }
      display_name = "GitHub Actions"
      issuer_uri   = "https://token.actions.githubusercontent.com"
    }
  }

}
