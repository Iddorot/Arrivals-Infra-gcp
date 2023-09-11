resource "random_password" "database_password" {
  length  = 32
  special = false
}

resource "google_sql_database_instance" "instance" {
  name             = "psql-${var.service}-${var.environment}"
  database_version = "POSTGRES_13"
  region           = var.region
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection = true
}

resource "google_sql_database" "database" {
  name     = "django"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "django" {
  name     = "django"
  instance = google_sql_database_instance.instance.name
  password = random_password.database_password.result
}
