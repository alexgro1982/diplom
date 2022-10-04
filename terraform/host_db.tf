resource "yandex_compute_instance" "db-groshev-site" {
  count = 2
  name        = "db0${count.index+1}-groshev-site"
  hostname    = "db0${count.index+1}.groshev.site"
  zone        = "ru-central1-a"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.centos-7.id}"
      name = "root-db0${count.index+1}"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.net-internal.id}"
    nat = true
    ip_address = "192.168.50.10${count.index+1}"

  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
