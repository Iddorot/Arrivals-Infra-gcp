output "superuser_password" {
  value     = google_secret_manager_secret_version.superuser_password.secret_data
  sensitive = true
}
