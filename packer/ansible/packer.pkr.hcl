source "vagrant" "ubuntu" {
  source_path  = "ubuntu/xenial64"
  provider     = "virtualbox"
  communicator = "ssh"
  output_dir   = "artifact"
  add_force    = true
  add_insecure = true
}

build {
  sources = ["source.vagrant.ubuntu"]

  provisioner "shell" {
    inline = ["sudo apt update", "sudo apt install -y ansible"]
  }

  provisioner "ansible-local" {
    playbook_file = "ansible/docker-install.yaml"
  }

  provisioner "shell" {
    inline = ["echo Docker install test: $(sudo docker --version)"]
  }
  provisioner "shell" {
    inline = ["echo Docker-Compose install test: $(sudo docker compose --version)"]
  }
}
