source "virtualbox-iso" "ubuntu" {
  guest_os_type = "Ubuntu_64"

  iso_url      = "https://cdimage.ubuntu.com/ubuntu/releases/bionic/release/ubuntu-18.04.6-server-amd64.iso"
  iso_checksum = "file:https://cdimage.ubuntu.com/ubuntu/releases/bionic/release/SHA256SUMS"

  disk_size = 20480

  boot_command = [
    "<esc><wait><esc><wait>",
    "<enter><wait>",
    "/install/vmlinuz<wait> ",
    "auto<wait> ",
    "console-setup/ask_detect=false<wait> ",
    "debconf/frontend=noninteractive<wait> ",
    "grub-installer/bootdev=/dev/sda<wait> ",
    "debian-installer=en_US<wait> ",
    "fb=false<wait> ",
    "initrd=/install/initrd.gz<wait> ",
    "kbd-chooser/method=us<wait> ",
    "keyboard-configuration/layout=USA<wait> ",
    "keyboard-configuration/variant=USA<wait> ",
    "locale=en_US<wait> ",
    "netcfg/get_hostname=ubuntu<wait> ",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
    "initrd=/install/initrd.gz<wait> -- <enter><wait>"
  ]

  http_directory = "http"

  headless = false

  ssh_username = "vagrant"
  ssh_password = "vagrant"
  ssh_timeout  = "30m"

  output_directory = "artifact"

  shutdown_command = "echo 'vagrant' | sudo -S shutdown -P now"
}

build {
  sources = ["sources.virtualbox-iso.ubuntu"]

  provisioner "shell" {
    inline = [
      "apt update",
      "apt install -y apache2",
      "chown -R vagrant /var/www/html"
    ]
    execute_command = "echo 'vagrant' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }

  post-processor "vagrant" {
    provider_override = "virtualbox"
  }
}

