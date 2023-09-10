variable "github_org_name" {
  type = string
}

variable "github_app_id" {
  type = string
}

variable "github_app_installation_id" {
  type = string
}

variable "github_app_private_key" {
  type      = string
  sensitive = true
}

variable "github_runner_ready" {
  type        = number
  default     = 3
  description = "The number of runners to be registered"
}

variable "github_runner_labels" {
  type        = list(string)
  default     = ["homelab"]
  description = "A set of labels to place on the runner for selection"
}

variable "github_runner_image" {
  type        = string
  default     = "docker.io/summerwind/actions-runner-dind:v2.308.0-ubuntu-22.04"
  description = "The container image of runner"
}

variable "enable_nvidia_gpu" {
  type        = bool
  default     = false
  description = "The Actions runner pod requests GPU resource"
}
