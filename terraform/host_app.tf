resource "yandex_compute_instance" "app-groshev-site" {
  name        = "app-groshev-site"
  hostname    = "app.groshev.site"
  zone        = "ru-central1-a"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.centos-7.id}"
      name = "root-app"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.net-internal.id}"
    nat = true
    ip_address = var.ip_addr["app"]

  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}