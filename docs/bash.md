# Bash scripting (rövid ismétlés)
## Shebang (#!)
A shebang az első sor egy Bash szkriptben, és megmondja a rendszernek, hogy melyik értelmezőt használja. A Bash szkriptek esetén általában így néz ki:<br>
__#!/bin/bash__
## Változók
Változót létrehozása értékadással:<br>
```shell
name="John"
```
Hogy ez a változó használható legyen az Bash által indított programokban vagy szkriptekben (egy fajta öröklődésnek is tekinthető módon), az export kulcsszót kell használni.
```shell
export name
```
A változó értékét a $ szimbólum segítségével lehet elérni:
```shell
echo "Helló, $name!"
```
## Fájl és navigációs műveletek
Leggyakoribbak: cd, touch, rm, mv, cp, és cat.
## if...else
A feltételes utasítások lehetővé teszik döntések meghozatalát a szkriptben:
```shell
if [ "$age" -ge 18 ]; then
  echo "Ön felnőtt."
else
  echo "Ön kiskorú."
fi
```
## Aritmetikai műveletek
A (( )) segítségével lehet aritmetikai műveleteket végrehajtatni:
```shell
score=$((5 + 3))
echo "5 + 3 = $score"
```
## Parancs beágyazás
Lehetséges egy parancs kimenetét változóban tárolni a beágyazás segítségével:
aktualis_datum=$(date +%Y-%m-%d)
## Listák
Létrehozása:
```shell
exampleArray=("alma" "banán" "cseresznye")
echo "Az első gyümölcs: ${exampleArray[0]}"
```
Parancs kimenetének tömbbé alakítása:
```shell
libContent=$(ls)
```
## Ciklusok (for és while)
A Bash támogatja a for és while ciklusokat listák bejárásához vagy parancsok ismételt végrehajtásához:
```shell
for i in {1..5}; do
  echo "$i"
done
counter=0
while [ $counter -lt 5 ]; do
  echo "Counter: $counter"
  ((szamlalo++))
done
```
## Függvények
Függvények definiálása szokásos módon történik, annyi különbséggel hogy nincs argumentum listája. Ha szeretnénk bemeneti argumentumokat, $1 $2... stb. változókat tudjuk használni. 
```shell
function greet() {
  echo "Helló, $1!"
}

greet "Alice"
```
## Parancssori argumentumok
Akár csak a függvények esetén:
```shell
#!/bin/bash
# File name: runthis.sh
echo "Az első argumentum: $1"
echo "A második argumentum: $2"
```
Szkript fájl futtatása:
```shell
./runthis.sh first second
```
## Bemenet és kimenet átirányítása
A Bash lehetővé teszi a bemenet és kimenet átirányítását olyan szimbólumokkal, mint < a bemenet és > a kimenet számára.<br>
Bemenet átirányítása fájlból
```shell
cat < bemenet.txt
```
Kimenet átirányítása fájlba (felülírás)
```shell
echo "Helló" > kimenet.txt
```
Kimenet átirányítása fájlba (hozzáfűzés)
```shell
echo "Világ" >> kimenet.txt
```
Érdemes utánanézni az stdin, stdout, stderr kifejezéseknek is.
## Pipe (|)
A pipe arra szolgál, hogy egy parancs kimenetét továbbítsa egy másiknak bemenetként.<br>
Kilistázza az összes fájlt az aktuális könyvtárban, majd továbbítja az eredményt a 'grep' parancsnak mely leszűri az eredmény a .txt fájlokra.
```shell
ls | grep ".txt"
```
## Exit code
Minden Bash parancs visszaad egy kilépési státuszkódot. Az 0 érték sikert jelent, míg a nem nulla értékek hibát jeleznek. A legutóbbi program kilépési kódját a __$?__ változóval tudjuk lekérdezni. A __return__ kulcsszóval van lehetőségünk saját visszatérési értéked adni egy-egy szkriptnek.


