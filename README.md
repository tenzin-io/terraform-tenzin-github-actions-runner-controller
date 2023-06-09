# README
This Terraform module installs GitHub Actions runner controller on a Kubernetes cluster.

**More details**
- <https://github.com/actions/actions-runner-controller/tree/master/charts/actions-runner-controller>
- <https://github.com/actions/actions-runner-controller/blob/master/docs/authenticating-to-the-github-api.md>

<!-- BEGIN_TF_DOCS -->


## Resources

| Name | Type |
|------|------|
| [helm_release.actions_runner_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.actions_runner_deployment](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_nvidia_gpu"></a> [enable\_nvidia\_gpu](#input\_enable\_nvidia\_gpu) | The Actions runner pod requests GPU resource | `bool` | `false` | no |
| <a name="input_github_app_id"></a> [github\_app\_id](#input\_github\_app\_id) | n/a | `string` | n/a | yes |
| <a name="input_github_app_installation_id"></a> [github\_app\_installation\_id](#input\_github\_app\_installation\_id) | n/a | `string` | n/a | yes |
| <a name="input_github_app_private_key"></a> [github\_app\_private\_key](#input\_github\_app\_private\_key) | n/a | `string` | n/a | yes |
| <a name="input_github_org_name"></a> [github\_org\_name](#input\_github\_org\_name) | n/a | `string` | n/a | yes |
| <a name="input_github_runner_image"></a> [github\_runner\_image](#input\_github\_runner\_image) | The container image of runner | `string` | `"ghcr.io/actions/actions-runner-controller/actions-runner-dind:ubuntu-20.04"` | no |
| <a name="input_github_runner_labels"></a> [github\_runner\_labels](#input\_github\_runner\_labels) | A set of labels to place on the runner for selection | `list(string)` | <pre>[<br>  "homelab"<br>]</pre> | no |
| <a name="input_github_runner_ready"></a> [github\_runner\_ready](#input\_github\_runner\_ready) | The number of runners to be registered | `number` | `3` | no |
<!-- END_TF_DOCS -->
