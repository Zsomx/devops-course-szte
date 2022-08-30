# Daemons & services
## Démonok azaz háttérben futó szolgáltatások kezelése
Alapvetően 2 utasítást használunk erre: **systemctl** és a **service**.
### systemctl
Ez a SystemD nevű programnak egy alprogramja tulajdonképpen. Az óra célja miatt, mi azonban csak a folyamat menedzsment részét fogjuk tárgyalni. Egy adott program démonként való futtatásához definiálni kell egy service fájlt, melyet az **/etc/systemd/system** helyen hozunk létre .service kiterjesztéssel. Ezen fájlok létrehozása az esetek többségében nem feladatunk. Kezeléséhez root jogosultság szükséges!\
**Fontosabb parancsok**
 - systemctl start <démon program neve>
 - systemctl stop <démon program neve>
 - systemctl restart <démon program neve>
 - systemctl enable <démon program neve>: Engedélyezi, hogy boot során vagy rögtön utána elinduljon a program.
 - systemctl disable <démon porgram neve>: Tiltja, hogy boot során vagy rögtön utána elinduljon a program.
 - systemctl status <démon program neve>: Program állapota, azaz fut-e? Mit futtat? Stb...
#### /etc/init.d
Vannak olyan esetek, amikor nem standard SystemD által alkalmazott fájlokkal dolgozunk. Ezek a fájlok az /etc/init vagy /etc/init.d mappákban landolnak. Ezeknek a felolvasását is elvégzi, ezek a legtöbb esetben standard shell script fájlok egy adott struktúrával.
### service
Mamár a **systemctl** az uralkodó ezen területen, azonban néhol fel-fel bukkanak olyan Linux kiadások amik más folyamat kezelőt használnak. Mivel nem egységes ezen területe sem teljesen a pingvines rendszernek, elkészült a **service** ___wrapper___ utasítás. Ez elmaszkolja előllünk a tényleges démon kezelőt így számunkra lényegtelen mi valósítja meg ezt a funkciót, ha tudjuk a **service** utasításait, tudjuk használni. Kezeléséhez root jogosultság szükséges!\
**Fontosabb parancsok**
 - service <démon program neve> start
 - service <démon program neve> stop
 - service <démon program neve> restart
 - service <démon program neve> status