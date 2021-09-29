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
    inline = [
      "sudo apt update",
      "sudo apt install -y apache2",
      "sudo chown -R vagrant /var/www/html"
    ]
  }

  provisioner "file" {
    source      = "./html/sample.html"
    destination = "/var/www/html/"
  }
}
