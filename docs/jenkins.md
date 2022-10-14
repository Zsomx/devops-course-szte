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
A jobok kódból történő definiálását a Configuration as Code plugin támogatja. Működése a jenkins/Readme.md-ben található.
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