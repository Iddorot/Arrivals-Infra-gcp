<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret.django_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret.superuser_password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_iam_binding.django_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_binding) | resource |
| [google_secret_manager_secret_iam_binding.superuser_password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_binding) | resource |
| [google_secret_manager_secret_version.django_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_secret_manager_secret_version.superuser_password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_storage_bucket.assets](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.tfstate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_password.django_secret_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.superuser_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_instance"></a> [database\_instance](#input\_database\_instance) | sql instace value | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment | `string` | n/a | yes |
| <a name="input_google_service_account"></a> [google\_service\_account](#input\_google\_service\_account) | google cloud run service account value | `any` | n/a | yes |
| <a name="input_google_sql_database"></a> [google\_sql\_database](#input\_google\_sql\_database) | sql database value | `any` | n/a | yes |
| <a name="input_google_sql_user"></a> [google\_sql\_user](#input\_google\_sql\_user) | sql user from database module | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Google Cloud Region | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | google cloud run service name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_superuser_password"></a> [superuser\_password](#output\_superuser\_password) | n/a |
<!-- END_TF_DOCS -->