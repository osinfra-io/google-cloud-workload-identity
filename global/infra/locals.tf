# Local Values
# https://www.terraform.io/language/values/locals

locals {

  workload_identity = {
    "github-actions" = {

      # An attribute condition is a Common Expression Language (CEL) expression that can check assertion attributes and
      # target attributes. If the attribute condition evaluates to true for a given credential, the credential is accepted.
      # Otherwise, the credential is rejected.

      # Some of the claims embedded in the GitHub Actions OIDC token are not guaranteed to be unique, and tokens issued by
      # other GitHub organizations or repositories may contain the same values, allowing them to establish an identity.
      # To protect against this situation, always use an attribute condition to restrict access to tokens issued by your
      # GitHub organization.

      # GitHub guarantees the following ID to be unique and never re-used. This will protect against cybersquatting attacks.

      # To get the organization id, you can run the following curl command with a token that has the read:org scope against
      # your existing organization:

      # curl -H "Authorization: token $GITHUB_READ_ORG_TOKEN" https://api.github.com/orgs/osinfra-io

      attribute_condition = var.environment == "sb" ? "assertion.repository_owner_id==\"104685378\"" : "assertion.ref==\"refs/heads/main\"" && "assertion.repository_owner_id==\"104685378\" && assertion.ref==\"refs/heads/main\""

      # The tokens issued by your external identity provider contain one or more attributes. Some identity providers refer
      # to these attributes as claims. An attribute mapping defines how to derive the value of the Google STS token attribute
      # from an external token.

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
