# Usage
## 1. VM deployment
```
cd vms && packer build packer.json
vagrant up
```
## 2. Create cluster
 - Init the cluster on OpVM then join the AppVM.
 - Add labels to these nodes.<br>
The templates may help you.
## 3. Deploy stacks
Deploy the 3 YAML files from the VM directory: /home/vagrant/docker_resources