target "docker-metadata-action" {}

variable "APP" {
  default = "paseo"
}

variable "VERSION" {
  // renovate: datasource=docker depName=ghcr.io/getpaseo/paseo
  default = "0.15.3"
}

variable "SOURCE" {
  default = "https://github.com/getpaseo/paseo"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
