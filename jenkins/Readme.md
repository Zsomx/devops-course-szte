# Leírás
## Beüzemelés
A Vagrant fájl készít egy VM-et, telepít & configurál Docker klienst, elindítja a Jenkinst és a Docker Registryt ahol tárolni fogjuk a buildelt Docker imageket.
```
cd jenkins/vm && vagrant up
```
## Fájlok
### jenkins.dockerfile
Az eredeti Jenkinst automatikus plugin telepítéssel. Többek közt így kerül fel a Configuration as Code plugin is.
### jenkins.yml & registry.yml
Elinítja a 2 konténert.
### docker/config mappa
A Jekins Configuration as Code plugin az itt található fájlokat felolvassa. Itt állítódik be a Docker API elérés, a worker konténer template és definiálódik 3-3 job.<br>
Ez a mappa synced folder formájában van becsatolva a Vagrantba, így a módosítások azonnal bekerülnek a VM-be is. Ezen módosítások érvényesítése a Jenkins webes felületén a Manage Jenkins --> Configuration as Code --> Reload existing configuration gomb megnyomásával történhet. (Lehet Dockerben történő Jenkins konténer törléssel és újralétrehozással is, de ez lassabb.)
## WebUI
Jenkins: localhost:8081 <br>
Express app (deployed by Jenkins jobs): localhost:3000