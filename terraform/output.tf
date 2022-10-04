
output "external_ip_address_for_DNS_Record" {
  value = "${yandex_compute_instance.groshev-site.network_interface.0.nat_ip_address}"
}
