output "instance" {
  value = google_sql_database_instance.instance
}

output "google_sql_user" {
  value = google_sql_user.django
}
output "google_sql_database" {
  value = google_sql_database.database
}