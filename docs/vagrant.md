# Vagrant
## Virtuális gépek
A virtuális gépek (VM) futtatásához két követelmény kell teljesüljön:

 - A CPU kell, hogy támogassa a virtualizációt.
 - Rendelkezésre kell álljon egy hypervisour program.

Hypervisor típusok:

 - Type 1 vagy bare-metal: Itt az operációs rendszer feladata, hogy VM-eket futtasson a lehető legoptimálisabban. Nincsen sallang az OS-ben. Példa.: ESXi
 - Type 2: Ez egy már meglévő OS-re telepített program és nem különbözik a többi felhasználó által futtatott egyéb dolgoktól (Firefox, Word, Fortnite.exe). Példa: VirtualBox.

A VM-ek minden esetben egy **teljesértékű operációs rendszert** futtatnak, külön kernellel, network stackel, user managementel stb. A legtöbb esetben a VM egy virtuális hálózat mögött jön létre, így ha szervert futtatunk akkor a VM portját továbbítani kell a host gép egy tetszőleges, szabad portjára. 

## VM automatizálás
### Klasszikus eset
Elindítunk egy VM-et, belépünk, kattingatunk vagy parancsokat adunk ki. Ezek eredményeként telepítjük és konfiguráljuk az OS-t. Ha ez hordozhatóvá szeretnénk tenni, akkor exportálhatjuk OVA/OVF fájlba melyet a legtöbb hypervisor ismer és tud kezelni. Ezek a fájlok verziózhatók azonban ameddig nem futtatjuk őket, semmit nem tudunk róluk.
### DevOps megközelítés
Az egész DevOps nézetnek fontos eleme az áttekinthetőség. Ezt ebben az esetben az _Infrastructure as Code_ megközelítéssel fogjuk megvalósítani. A Vagrant lehetővé teszi számunkra, hogy kódként tároljuk az összes tevékenységet amit egy VM-en elvégeznénk. Ezáltal akár a kimeneti artifact (ova/ovf/box) és az azt konfiguráló kód is verziózható. 

## Vagrant
Mindig a Vagrantfile-t olvassa fel. Ez egy Ruby fájl, melyhez egyedi parancsokat rendel a Vagrant (tehát egyfajta gemnek értelmezhető). Ezek az egyedi függvények a kiválasztott hypervisoral kommunikálnak. A kiindulás mindig egy meglévő VM (ebben a terminológiában **box**nak nevezzük) aminek a hardveres paramétereit módosítjuk majd parancsokat hajtunk végre rajta.

**Fontosabb parancsok:**
``` shell
    vagrant help
```
Rendelkezésre álló parancsok és azok rövid leírása.
``` shell
    vagrant up
```
Az aktuális mappában található vagrantfile-t végrehajtja.
``` shell
    vagrant halt
```
Az aktuális mappában található vagrantfile által létrehozott VM-et megállítja.
``` shell
    vagrant destroy
```
 Az aktuális mappában található vagrantfile által létrehozott VM-et törli a hypervisorból.
``` shell
    vagrant provision
```
Az aktuális mappában található vagrantfile provision blokkjait újra végrehajtja.

_Felmerülő problémák:_

 - Gitben tárolva hogyan kezeljünk jelszavakat, kulcsokat... stb.
 - Alap esetben kimeneti artifactot nem állít elő.
 - Hypervisor függő VM-ek. A kiindulási boxok már egy adott hypervisorhoz kötődnek, ezen módosítani itt nem lehet. Természetesen vannak megoldások rá, de ez kívül esik az óra keretein már.