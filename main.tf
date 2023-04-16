resource "helm_release" "actions_runner_controller" {
  name             = "actions-runner-controller"
  namespace        = local.namespace
  create_namespace = true
  repository       = "https://actions-runner-controller.github.io/actions-runner-controller"
  chart            = "actions-runner-controller"
  version          = "0.23.0"

  set {
    name  = "authSecret.create"
    value = true
  }

  set {
    name  = "authSecret.github_app_id"
    value = var.github_app_id
  }

  set {
    name  = "authSecret.github_app_installation_id"
    value = var.github_app_installation_id
  }

  set {
    name  = "authSecret.github_app_private_key"
    value = var.github_app_private_key
  }

  set {
    name  = "scope.singleNamespace"
    value = true
  }

}

resource "helm_release" "actions_runner_deployment" {

  name             = "actions-runner-deployment"
  namespace        = local.namespace
  create_namespace = false
  chart            = "${path.module}/files/actions-runner-deployment"

  set {
    name  = "github_org_name"
    value = var.github_org_name
  }

  set {
    name  = "github_runners_ready"
    value = var.github_runners_ready
  }

  set {
    name  = "runner_labels"
    value = "{${var.github_runner_labels}}"
  }

  depends_on = [helm_release.actions_runner_controller]
}

