# Linux alapismeretek (ismétés)
Mivel a tárgy Msc hallgatóknak készült, ezért feltételezzük az Operációs rendszerek kurzus gyakorlati tudásának legalább részleges meglétét. 
Amennyiben számodra ismeretlen teljesen a Linux és annak világa, vagy csak ismételnél egy nagyot, következő oktató videókat ajánljuk:

- Ubuntu alapismeretek: https://www.youtube.com/watch?v=ROjZy1WbCIA
- Shell scripting alapismeretek: https://www.youtube.com/watch?v=v-F3YLd6oMw

# Daemons & services
## Démonok azaz háttérben futó szolgáltatások kezelése
Alapvetően 2 utasítást használunk erre: **systemctl** és a **service**.
### systemctl
Ez a SystemD nevű program CLI eszköze. Az óra rövidsége és fókuszáltsága okán, mi csak a folyamat menedzsment részét fogjuk tárgyalni főként.

**Rövid elmélet**

- Inializálja az egész OS-t
- Unitokat kezel, számunkra a service típusú unit lesz érdekes
- Unit definíciós fájlok 3 helyen találhatóak a Linuxon. Precedencia szint szerint:
    - /etc/systemd/system
    - /run/systemd/system
    - /lib/systemd/system

**Fontosabb parancsok**

 - systemctl start ___program-neve___
 - systemctl stop ___program-neve___
 - systemctl restart ___program-neve___
 - systemctl enable ___program-neve___:
    - Engedélyezi, hogy automatikusan az OS-el elinduljon a program.
 - systemctl disable ___program-neve___:
    - Tiltja, hogy automatikusan elinduljon a program.
 - systemctl status ___program-neve___:
    - Program állapota, azaz fut-e? Mit futtat? Stb...
#### /etc/init.d
Vannak olyan esetek, amikor nem standard SystemD által alkalmazott fájlokkal dolgozunk. Ezek a fájlok az /etc/init vagy /etc/init.d mappákban landolnak. Ezeknek a felolvasását is elvégzi, melyek a esetben standard shell script fájlok egy adott struktúrával.
### service
Ma már a **systemctl** az uralkodó ezen területen, azonban néhol fel-fel bukkanak olyan Linux kiadások amik más folyamat kezelőt használnak. Mivel nem egységes ezen területe sem teljesen a pingvines rendszernek, elkészült a **service** ___wrapper___ utasítás. Ez elmaszkolja előllünk a tényleges service kezelőt így számunkra lényegtelen mi valósítja meg ezt a funkciót, ha tudjuk a **service** utasításait, tudjuk használni.

**Fontosabb parancsok**

 - service ___program-neve___ start
 - service ___program-neve___ stop
 - service ___program-neve___ restart
 - service ___program-neve___ status