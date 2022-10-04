resource "yandex_compute_instance" "groshev-site" {
  name        = "groshev-site"
  hostname    = "www.groshev.site"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.centos-7.id}"
      name = "root-nginx"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.net-internal.id}"
    nat = true
    ip_address = var.ip_addr["nginx"]

  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
