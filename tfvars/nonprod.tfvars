cis_2_2_logging_sink_project_id = "shared-logs01-tf33be-nonprod"
env                             = "nonprod"
folder_id                       = "357792503223"

workload_identity = {
  "github-actions" = {
    attribute_mapping = {
      "attribute.actor"      = "assertion.actor"
      "attribute.aud"        = "assertion.aud"
      "attribute.repository" = "assertion.repository"
      "google.subject"       = "assertion.sub"
    }
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}
