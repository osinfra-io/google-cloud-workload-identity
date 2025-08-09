terraform {
  backend "gcs" {
    prefix = "google-cloud-workload-identity"
  }
}
