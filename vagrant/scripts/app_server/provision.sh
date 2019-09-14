#Adding OpsBase Docker registry to trusted registries. 
sudo mv /home/vagrant/daemon.json /etc/docker/ && sudo service docker restart
#Get example config for Filebeat
curl -L -O https://raw.githubusercontent.com/elastic/beats/7.3/deploy/docker/filebeat.docker.yml --output /home/vagrant/filebeat.docker.yml
# Config Elasticsearch for filebeat
docker run docker.elastic.co/beats/filebeat:7.3.2 setup -E setup.kibana.host="192.168.2.2:5601" -E output.elasticsearch.hosts=["192.168.2.2:9200"]