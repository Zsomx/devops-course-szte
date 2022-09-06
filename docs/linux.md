# Linux alapismeretek (ismétés)
Mivel a tárgy Msc hallgatóknak készült, ezért feltételezzük az Operációs rendszerek kurzus gyakorlati tudásának legalább részleges meglétét. 
Amennyiben számodra ismeretlen teljesen a Linux és annak világa, vagy csak ismételnél egy nagyot, következő oktató videókat ajánljuk:

- Ubuntu alapismeretek: https://www.youtube.com/watch?v=ROjZy1WbCIA
- Shell scripting alapismeretek: https://www.youtube.com/watch?v=v-F3YLd6oMw

# Daemons & services
## Démonok azaz háttérben futó szolgáltatások kezelése
Alapvetően 2 utasítást használunk erre: **systemctl** és a **service**.
### systemctl
Ez a SystemD nevű programnak egy alprogramja tulajdonképpen. Az óra célja miatt, mi azonban csak a folyamat menedzsment részét fogjuk tárgyalni. Egy adott program démonként való futtatásához definiálni kell egy service fájlt, melyet az **/etc/systemd/system** helyen hozunk létre .service kiterjesztéssel. Ezen fájlok létrehozása az esetek többségében nem feladatunk. Kezeléséhez root jogosultság szükséges!

**Fontosabb parancsok**

 - systemctl start program-neve
 - systemctl stop program-neve
 - systemctl restart program-neve
 - systemctl enable program-neve:
    - Engedélyezi, hogy automatikusan az OS-el elinduljon a program.
 - systemctl disable program-neve:
    - Tiltja, hogy automatikusan elinduljon a program.
 - systemctl status program-neve:
    - Program állapota, azaz fut-e? Mit futtat? Stb...
#### /etc/init.d
Vannak olyan esetek, amikor nem standard SystemD által alkalmazott fájlokkal dolgozunk. Ezek a fájlok az /etc/init vagy /etc/init.d mappákban landolnak. Ezeknek a felolvasását is elvégzi, ezek a legtöbb esetben standard shell script fájlok egy adott struktúrával.
### service
Mamár a **systemctl** az uralkodó ezen területen, azonban néhol fel-fel bukkanak olyan Linux kiadások amik más folyamat kezelőt használnak. Mivel nem egységes ezen területe sem teljesen a pingvines rendszernek, elkészült a **service** ___wrapper___ utasítás. Ez elmaszkolja előllünk a tényleges démon kezelőt így számunkra lényegtelen mi valósítja meg ezt a funkciót, ha tudjuk a **service** utasításait, tudjuk használni. Kezeléséhez root jogosultság szükséges!

**Fontosabb parancsok**

 - service program-neve start
 - service program-neve stop
 - service program-neve restart
 - service program-neve status