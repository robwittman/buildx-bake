variable "TAG" {
  default = "latest"
}

group "default" {
  targets = [
    "base_image",
    "app_image"
  ]
}

target "base_image" {
  context = "base"
  tags = [
    "ghcr.io/robwittman/buildx-bake/base:${TAG}"
  ]
}

target "app_image" {
  context = "app"
  contexts = {
    base = "target:base_image"
  }
  tags = [
    "ghcr.io/robwittman/buildx-base/app:${TAG}"
  ]
}
