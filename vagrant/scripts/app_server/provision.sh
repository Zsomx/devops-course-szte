#Adding OpsBase Docker registry to trusted registries.
sudo mv /home/vagrant/daemon.json /etc/docker/ && sudo service docker restart
# Config Elasticsearch for filebeat
docker run docker.elastic.co/beats/filebeat:7.3.2 setup -E setup.kibana.host="192.168.2.2:5601" -E output.elasticsearch.hosts=["192.168.2.2:9200"]