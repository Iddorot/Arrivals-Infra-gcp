#  - superuser_password                                     = (sensitive value) -> null

output "service_account_github_actions_email" {
  description = "Service Account used by GitHub Actions"
  value       = module.github_auth.service_account_github_actions_email
}

output "google_iam_workload_identity_pool_provider_github_name" {
  description = "Workload Identity Pood Provider ID"
  value       = module.github_auth.google_iam_workload_identity_pool_provider_github_name
}

output "instance_name" {
  value = module.database.instance.name
  sensitive = false
}

output "service_name" {
  value = module.cloud_run.service_name
}

output "service_url" {
  value = module.cloud_run.service_url
}

output "superuser_password" {
  value     = module.secrets.superuser_password
  sensitive = true
}
