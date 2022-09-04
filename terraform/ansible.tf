resource "null_resource" "ansible" {
  provisioner "local-exec" {
      command = "ansible-playbook -i ../ansible/inventory ../ansible/main.yml"
  }
  depends_on = [
    local_file.inventory
  ]
}