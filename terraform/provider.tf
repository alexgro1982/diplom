terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "alexgro-diplom"
    region     = "ru-central1-a"
    key        = "terraform/terraform.tfstate"
    access_key = "YCAJETtvdJgCv203NmYKBurSv"
    secret_key = "YCNCsV9NUbgwF-XJlilDW0JmbHdYDTzmimpgErxP"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  cloud_id  = "b1gjbb7p87vfict797vu"
  folder_id = "b1gg9e65rd2rn2a5idvl"
}
