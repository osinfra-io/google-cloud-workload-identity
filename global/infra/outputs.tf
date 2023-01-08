# Output Values
# https://www.terraform.io/language/values/outputs

output "project_number" {
  description = "The project number"
  value       = module.project.project_number
}

output "project_id" {
  description = "The project ID"
  value       = module.project.project_id
}

output "workload_identity_pool_ids" {
  description = "The workload identity pool IDs"
  value = {
    for k, v in google_iam_workload_identity_pool.this : k => v.name
  }
}

output "workload_identity_pool_provider_ids" {
  description = "The workload identity pool provider IDs"
  value = {
    for k, v in google_iam_workload_identity_pool_provider.this : k => v.name
  }
}
