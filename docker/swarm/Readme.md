# Használat
## 1. VM build & deployment (Packer szükséges, lásd GitHub Readme.md)
```
cd vms && packer build packer.json
vagrant up
```
## 2. Swarm klaszter létrehozása
OpsBase VM beállítása: <br>
Az init parancs ki fog írni egy parancsot, amit fel kell használjunk így mentsük el valahova.
```
vagrant ssh ops_base
docker swarm init --advertise-addr "192.158.5.2"
```
AppServer VM beállítása: <br>
A docker swarm join parancsot cseréljük ki a pontosan paraméterezettre, amit a fentebbi init parancs írt ki.
```
vagrant ssh app_server
docker swarm join --token $tokenstring 192.168.5.2:2377
```
Szerverek címkézése
```
vagrant ssh ops_base
docker node update app-server --label-add cloudrole=appnode
docker node update ops-base --label-add cloudrole=devopsnode
```
## 3. Deploy 
Swarm esetén stackeket élesítünk, jelen helyzetben 1 docker compose fájl = 1 stack.
```
vagrant ssh ops_base
cd /home/vagrant/docker_resources
docker stack deploy -c jenkins.yml cicd
docker stack deploy -c portainer.yml portainer
docker stack deploy -c registry.yml registry
```
A localhost:9000 web címen megjelenik a Portainer, a localhost:8081 címen a Jenkins. 
