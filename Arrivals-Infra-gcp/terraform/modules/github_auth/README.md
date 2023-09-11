<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_iam_workload_identity_pool.github](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_iam_workload_identity_pool) | resource |
| [google-beta_google_iam_workload_identity_pool_provider.github](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_iam_workload_identity_pool_provider) | resource |
| [google_project_iam_member.roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.github_actions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.github_actions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_repository_name"></a> [github\_repository\_name](#input\_github\_repository\_name) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Google Cloud Project ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_google_iam_workload_identity_pool_provider_github_name"></a> [google\_iam\_workload\_identity\_pool\_provider\_github\_name](#output\_google\_iam\_workload\_identity\_pool\_provider\_github\_name) | Workload Identity Pood Provider ID |
| <a name="output_service_account_github_actions_email"></a> [service\_account\_github\_actions\_email](#output\_service\_account\_github\_actions\_email) | Service Account used by GitHub Actions |
<!-- END_TF_DOCS -->