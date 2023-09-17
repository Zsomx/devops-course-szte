# Ansible
## Alap fogalmak
### Configuration Management
Ezt a fogalmat természetesen IT szempontból fogjuk értelmezni. Konfiguráció alatt érthetjük:

 - egy komplett IT ifrastruktúra felépítését (routerek, switchek, kliensek összessége)
 - egy szerver hardveres felépítését és BIOS beállítását
 - a telepített OS beállításait és telepített programjait
 - egy telepített program beállításait

 A kurzus során már láthattuk az összes elemet, hiszen a Vagrantal a virtuális gépekhez virtualizált hardvert állítottunk be (CPU, RAM), az általuk használt hálózatot is definiáltuk, valamint egy kiválasztott OS-en eszközötünk változásokat és telepítéseket. 
### Deklaratív leírás
Vagrant esetén Ruby nyelven definiáltunk mindent, mely egy imperatív nyelv. Leírtuk az egész folyamatot, hogy elérjük a kívánt eredményt. Röviden: a **hogyan** részt írtuk meg. 

_Megjegyzés: a VM hardver paraméterei tekinthetők deklaratív leírásnak az általunk használt esetben. Komolyabb Ruby programozás bevetése esetén már nem helytálló kijelentés._

A deklaratív leírás esetén nem a **hogyant** írjuk le, hanem a **mit**. Ebben az esetben csak az elérni kívánt célt fogalmazzuk meg, és a megvalósítást rábízzuk a keretrendszerre. Nem foglalkozunk azzal, hogyan oldja meg. 

Rally hasonlattal élve: a mitfárer mondja az irányt (**mit**), a versenyző kormányozza oda az autót a kellő sebességgel és szögben (**hogyan**).
## Ansible felépítése
### Mire használjuk?
Bár sok esetben használható lenne, a kurzus során operációs rendszerek és azokra telepített szoftverek konfigurálására fogjuk bevetni. Ez a leggyakoribb alkalmazása is. 
### Playbook
Ez a bemeneti YAML fájl. 2 dolgot kell mindenképpen tartalmaznia: hosts & tasks. A hosts mondja meg, hogy a playbook milyen szerverekkel létesítsen kapcsolatot. A tasks pedig a szervereken elérendő állapotot írja le.
### Inventory
A struktúráltság érdekében ezt is YAML-ként kezeljük. Itt a kezelni kívánt szerverek kapcsolódási adatait tároljuk. A szerverek akár csoportokba is szervezhetőek, így amikor egy playbook adott csoporton hajtódik végre, **párhuzamosan** történik a konfigurációjuk.
### Használata
``` shell
ansible-playbook -i inventory.yml playbook.yml
```
