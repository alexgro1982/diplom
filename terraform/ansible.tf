resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 100"
  }

  depends_on = [
    local_file.inventory
  ]
}


resource "null_resource" "ansible" {
  provisioner "local-exec" {
      command = "ansible-playbook -i ../ansible/inventory ../ansible/main.yml --skip-tags RegisterRunner"
  }
  depends_on = [
    null_resource.wait
  ]
}
