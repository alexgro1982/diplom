resource "local_file" "inventory" {
    content = <<-DOC
    [nginx]
    netology.aklmz.ru   ansible_host=${yandex_compute_instance.netology-aklmz-ru.network_interface.0.nat_ip_address} ansible_user=centos
        DOC
    filename = "../ansible/inventory"
    depends_on = [
      yandex_compute_instance.netology-aklmz-ru
    ]
}