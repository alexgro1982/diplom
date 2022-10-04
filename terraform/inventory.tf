resource "local_file" "inventory" {
    content = <<-DOC
    [nginx]
    www.groshev.site   ansible_host=${yandex_compute_instance.groshev-site.network_interface.0.nat_ip_address} ansible_user=centos

    [app]
    app.groshev.site   ansible_host=${yandex_compute_instance.app-groshev-site.network_interface.0.nat_ip_address} ansible_user=centos

    [master]
    db01.groshev.site   ansible_host=${yandex_compute_instance.db-groshev-site[0].network_interface.0.nat_ip_address} ansible_user=centos

    [slave]
    db02.groshev.site   ansible_host=${yandex_compute_instance.db-groshev-site[1].network_interface.0.nat_ip_address} ansible_user=centos

    [gitlab]
    gitlab.groshev.site   ansible_host=${yandex_compute_instance.gitlab-groshev-site["gitlab"].network_interface.0.nat_ip_address} ansible_user=centos

    [runner]
    runner.groshev.site   ansible_host=${yandex_compute_instance.gitlab-groshev-site["runner"].network_interface.0.nat_ip_address} ansible_user=centos

    [monitoring]
    monitoring.groshev.site   ansible_host=${yandex_compute_instance.monitoring-groshev-site.network_interface.0.nat_ip_address} ansible_user=centos

    [dbserv:children]
    master
    slave

        DOC
    filename = "../ansible/inventory"
    depends_on = [
      yandex_compute_instance.groshev-site,
      yandex_compute_instance.db-groshev-site,
      yandex_compute_instance.app-groshev-site,
    ]
}
