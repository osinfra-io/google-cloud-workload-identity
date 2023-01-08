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

output "workload_identity_pool_names" {
  description = "The workload identity pool names"
  value = {
    for k, v in google_iam_workload_identity_pool.this : k => v.name
  }
}

output "workload_identity_pool_provider_names" {
  description = "The workload identity pool provider names"
  value = {
    for k, v in google_iam_workload_identity_pool_provider.this : k => v.name
  }
}
