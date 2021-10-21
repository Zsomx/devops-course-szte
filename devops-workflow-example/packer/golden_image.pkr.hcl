
source "vagrant" "virtualbox" {
  add_force    = true
  add_insecure = true
  communicator = "ssh"
  output_dir   = "./artifact"
  provider     = "virtualbox"
  source_path  = "ubuntu/xenial64"
}

build {
  sources = ["source.vagrant.virtualbox"]

  provisioner "shell" {
    inline = ["sudo apt update", "sudo apt install -y ansible openjdk-9-jdk-headless"]
  }

  provisioner "ansible-local" {
    playbook_file = "../ansible/docker-install.yml"
  }

  provisioner "shell" {
    inline = ["echo Docker install test: $(sudo docker --version)"]
  }

  provisioner "ansible-local" {
    playbook_file = "../ansible/docker-compose-install.yml"
  }

  provisioner "shell" {
    inline = ["echo Docker-Compose install test: $(sudo docker-compose --version)"]
  }

}
