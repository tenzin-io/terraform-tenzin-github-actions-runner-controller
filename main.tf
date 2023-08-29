resource "helm_release" "actions_runner_controller" {
  name             = "actions-runner-controller"
  namespace        = local.namespace
  create_namespace = true
  repository       = "https://actions-runner-controller.github.io/actions-runner-controller"
  chart            = "actions-runner-controller"
  version          = "0.23.3"
  disable_webhooks = true

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

locals {
  runner_labels = join(",", var.github_runner_labels)
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
    name  = "runner.ready"
    value = var.github_runner_ready
  }

  set {
    name  = "runner.image"
    value = var.github_runner_image
  }

  set {
    name  = "runner.labels"
    value = "{${local.runner_labels}}"
  }

  set {
    name  = "runner.gpu_request"
    value = var.enable_nvidia_gpu ? 1 : 0
  }

  depends_on = [helm_release.actions_runner_controller]
}
