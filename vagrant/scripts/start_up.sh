docker-compose -f /home/vagrant/docker/jenkins-dc.yaml up -d 
docker-compose -f /home/vagrant/docker/registry-dc.yaml up -d 
docker-compose -f /home/vagrant/docker/portainer-dc.yaml up -d
docker-compose -f /home/vagrant/docker/elk-dc.yaml up -d