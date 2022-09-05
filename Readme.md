# DevOps & Cloud basics course material 
## Purpose
This material is used for education purposes at the University of Szeged (SZTE)
## Prerequisits 
### Vagrant environment
 - [VirtualBox](https://www.virtualbox.org/) = 6.0.12
 - [Packer](https://www.packer.io/) >= 1.7.0
 - [Vagrant](https://www.vagrantup.com/) >= 2.2.5
 - [Ansible](https://www.ansible.com/resources/get-started) ~ 2.9.12 
### Docker-Swarm environment
 - [Docker](https://docs.docker.com/) >= 19.03.4
 - [Docker-Compose](https://docs.docker.com/compose/) >= 1.26.2
## Known issues:
 - Sometimes the VirtualBox timezone changes and this colud cause a lot of trouble. To solve this add this command to the scripts [Source](https://stackoverflow.com/questions/33939834/how-to-correct-system-clock-in-vagrant-automatically):
```
$ sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime
```

## Next-gen docs (preview)

[GitHub pages](https://zsomx.github.io/devops-course-szte/)
