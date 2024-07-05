terraform {
  required_version = "~> 1.5"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.87.0"
    }
  }

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "terraform-state-std-022-44"
    region   = "ru-central1"
    key      = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
