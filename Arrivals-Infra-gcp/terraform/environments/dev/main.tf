module "apis" {
source = "git::https://github.com/ArrivalsApp/Arrivals-Infra.git//modules/apis?ref=main"
  project = var.project
}

module "database" {
  source      = "git::https://github.com/ArrivalsApp/Arrivals-Infra.git//modules/database?ref=main"
  service     = var.service
  environment = var.environment
  region      = var.region
  project     = var.project

}

module "secrets" {
  depends_on             = [module.apis, module.database, module.cloud_run]
  source                 = "git::https://github.com/ArrivalsApp/Arrivals-Infra.git//modules/secrets?ref=main"
  service                = var.service
  environment            = var.environment
  region                 = var.region
  project                = var.project
  google_sql_user        = module.database.google_sql_user
  database_instance      = module.database.instance
  google_sql_database    = module.database.google_sql_database
  google_service_account = module.cloud_run.service_account

}

module "cloud_run" {
  source            = "git::https://github.com/ArrivalsApp/Arrivals-Infra.git//modules/cloud_run?ref=main"
  service           = var.service
  environment       = var.environment
  region            = var.region
  project           = var.project
  database_instance = module.database.instance

}

module "github_auth" {
  source  = "git::https://github.com/ArrivalsApp/Arrivals-Infra.git//modules/github_auth?ref=main"
  project = var.project
  github_repository_name = var.github_repository_name

}
