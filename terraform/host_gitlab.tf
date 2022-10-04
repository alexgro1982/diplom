locals {
  gitlab_hosts = [
    {
      ip_address = var.ip_addr["gitlab"]
      name = "gitlab"
    },
    {
      ip_address = var.ip_addr["runner"]
      name = "runner"
    }
  ]
}

resource "yandex_compute_instance" "gitlab-groshev-site" {
  for_each = {
    for index, vm in local.gitlab_hosts:
    vm.name => vm
  }
  name        = "${each.value.name}-groshev-site"
  hostname    = "${each.value.name}.groshev.site"
  zone        = "ru-central1-a"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.centos-7.id}"
      name = "root-${each.value.name}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.net-internal.id}"
    nat = true
    ip_address = "${each.value.ip_address}"

  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
