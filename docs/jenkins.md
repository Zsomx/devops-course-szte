# Jenkins
## CI/CD
A Jenkins elsődlegesen a CI eszköz. Feladata, hogy a gitben található kódokra trigger esemény hatására (polling, push, pull request) checkoutolja a kódot és ezekre teszteket futtasson. Hogy pontosan mit és hogyan, azt pipeline fájlban definiáljuk. A CI akkor hatékony, ha minden push eseményre lefuttatja az alapvető teszteket. <br>
A CD (akár Delivery, akár Deployment) nem szorosan a Jenkins feladata azonban a gyakorlatban gyakran arra is használják így ezt mi bemutatjuk.<br>
_Megjegyzés_: A kurzus során nem fogunk triggereket bemutatni, mivel lokális környezetben a beadandók írása során voltak technikai nehézségek. GitHub Actions és GitLab esetén kerül majd bemutatásra.
## Job és pipeline
A Jenkinsben elsőként jobokat hozunk létre. Ezek sokmindent definiálhatnak, azonban számunkra most 2 dolog nagyon fontos: a triggereket és a pipeline. A triggerek definiálásával ezek bekövetkezésekor a megadott helyen megkeresi és lefuttatja a pipeline kódot. A pipeline egy egyszerűsített Groovy kód, mely a Jenkinsel kommunikálva különböző feladatokat hajt végre. Ilyen feladat a kód checkoutolása, függőségeinek telepítése, kód tesztelése valamilyen formában... stb. <br>
### Pipeline felépítése
Struktúrális:
 - agent: Definiálja a pipelinet futtató nodeot. A mi példánkban ezek Docker agentek lesznek.
 - stages & stage: fázisok definiálása
 - step: stagen belüli legelemibb műveletek blokkja
Műveletek:
 - git: git repository checkout végrehajtása
 - sh: shell parancs futtatása
### Job definiálása kódból (Jenkins Configuration as Code)
A letebb látható kódok létrehozhatók a felületen is. New item --> Pipeline. A következő oldal alján választhatjuk ki, hogy Pipeline script (azaz helyben, a Jenkinsen írt és tárolt) vagy Pipeline script from SCM (source code management, azaz gitben tárolt) beállításokat használjunk.<br>
A jobok kódból történő definiálását a Configuration as Code plugin támogatja.
#### Pipeline beolvasása gitből
```
pipelineJob('CI - GIT') {
definition {
        cpsScm {
            scm {
                git {
                remote {
                    url('https://github.com/Zsomx/express_example.git')
                }
                branch('*/2022.jenkins')
                }
            }
        lightweight()
        scriptPath('ci.jenkinsfile')
        }
    }
}
```
A konfiguráció részleteinek megértése nincs a kurzus keretei közt, ami fontos:
 - url: a Jenkinsfile (pipeline) git repóját definiáljuk
 - branch: az adott repó branchét definiálja ahol a pipeline fájl található
 - lightweight(): azt valósítja meg, hogy a Job futásakor CSAK a pipeline kód kerül letöltésre, nem az egész repó
 - scriptPath('filename'): az adott nevű pipeline fájlt fogja letölteni és végrehajtani a job
#### Pipeline beolvasása Job definícióból
```
pipelineJob('CI - LOCAL') {
definition {
    cps {
        script("""\
        pipeline{
            agent {
                label "nodejs-agent"
            }
            stages {
                stage("Git clone"){
                    steps{
                        git url:"https://github.com/Zsomx/express_example.git"
                    }
                }
                stage("NPM install"){
                    steps{
                        sh "npm i"
                    }
                }
                stage("Test"){
                    steps{
                        sh 'npm run-script test'
                    }
                }
            }
        }""".stripIndent())
        }
    }
}
```
Az előzőtől eltérés, hogy itt nem git alapú definíciója van hanem rögtön itt van definiálva a pipeline is. Szintaktikailag fontos, hogy a pipeline code multiline stringben van!
# Minta feladat működése (beadandónál lehet és ajánlott erre építkezni)
## Beüzemelés
1. Vagrantfile futtatása létrehoz nekünk egy komplett VM-et, benne a Jenkinsel és Registryvel.
2. A jenkins.yml futtatásakor előszőr buildeli a jenkins.dockerfile-t.
    - Ez kibővíti a Jenkisnt plugin előtelepítéssel (jenkins/docker/config/plugins.text).
    - Engedélyezi, hogy felhasználó létrehozás nélkül használható legyen.
    - Definiálja, hogy a Jenkins honnan olvassa fel a konfigurációt.
3. A Jenkins indulásakor felolvassa a jenkins/docker/config mappa fájljait és a 8080-as porton figyel, melyet a Vagrant 8081-es portra továbbítja számunkra (localhost:8081).
   - general.yml: Alapvető beállítások. Ami itt fontos: beállítja URL-nek a VM belső IP címét.
    - docker.yml
        - Definiáljuk a Docker API elérését a Jenkins számára, hogy utasításokat adhasson neki. Erre azért van szükség, mert minden pipeline 1-1 külön konténerben fog futni. Ha a pipeline lefutott, a konténer visszaküldi az eredményt és törlődik.
        - docker-agent egy olyan, pipeline által használható konténer paramétereit tartalmazza, mely a Docker API elérését valósítja meg __pipeline szinten__! Ezt az Express minta alkalmazásunk konténerizálására és deploymentjére használjuk majd.
        - nodejs-agent egy olyan, pipeline által használható konténer paramétereit tartalmazza, melyben előre telepítve van a NodeJS egy verziója. Ennek segítségével a minta alkalmazás tesztjeit tudjuk lefuttatni.
    - pipelines-local.yml: Létrehoz 3, a fájlokban definiált jobot és pipeline. Fontos, hogy itt a pipeline kódot magát is tartalmazzák a konfigurációs fájlok.
    - pipelines-remote.yml: Létrehoz 3 jobot, melyek a pipeline fájlt a meghatározott git repoban keresik meg. Itt elválik a pipeline kódja a Jenkins konfigurációjától. Ez a jobb megoldás!
4. A registry.yml elindítja a Docker Registry-t. Ide fogjuk feltölteni a build után kapott Docker imageket.