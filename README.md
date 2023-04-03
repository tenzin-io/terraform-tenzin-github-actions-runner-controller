# README
This Terraform module installs GitHub Actions runner controller on a Kubernetes cluster.

**More details**
- <https://github.com/actions/actions-runner-controller/tree/master/charts/actions-runner-controller>
- <https://github.com/actions/actions-runner-controller/blob/master/docs/authenticating-to-the-github-api.md>

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.actions_runner_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.actions_runner_deployment](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_app_id"></a> [github\_app\_id](#input\_github\_app\_id) | n/a | `string` | n/a | yes |
| <a name="input_github_app_installation_id"></a> [github\_app\_installation\_id](#input\_github\_app\_installation\_id) | n/a | `string` | n/a | yes |
| <a name="input_github_app_private_key"></a> [github\_app\_private\_key](#input\_github\_app\_private\_key) | n/a | `string` | n/a | yes |
| <a name="input_github_org_name"></a> [github\_org\_name](#input\_github\_org\_name) | n/a | `string` | n/a | yes |
| <a name="input_github_runners_ready"></a> [github\_runners\_ready](#input\_github\_runners\_ready) | n/a | `number` | `3` | no |
<!-- END_TF_DOCS -->
