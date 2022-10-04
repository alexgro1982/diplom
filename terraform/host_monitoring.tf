resource "yandex_compute_instance" "monitoring-groshev-site" {
  name        = "monitoring-groshev-site"
  hostname    = "monitoring.groshev.site"
  zone        = "ru-central1-a"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.centos-7.id}"
      name = "root-monitoring"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.net-internal.id}"
    nat = true
    ip_address = var.ip_addr["monitoring"]

  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
