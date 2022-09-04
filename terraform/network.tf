resource "yandex_vpc_network" "net" {
  name           = "net"
}

resource "yandex_vpc_subnet" "net-internal" {
  name           = "net-internal"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["192.168.50.0/24"]
}
