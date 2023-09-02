# Local Values
# https://www.terraform.io/language/values/locals

locals {

  workload_identity = {
    "github-actions" = {
      # attribute_condition = var.environment == "sb" ? null : "assertion.ref==\"refs/heads/main\""
      attribute_mapping = {
        "attribute.actor"      = "assertion.actor"
        "attribute.aud"        = "assertion.aud"
        "attribute.ref"        = "assertion.ref"
        "attribute.repository" = "assertion.repository"
        "google.subject"       = "assertion.sub"
      }
      display_name = "GitHub Actions"
      issuer_uri   = "https://token.actions.githubusercontent.com"
    }
  }
}
