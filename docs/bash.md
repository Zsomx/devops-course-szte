# Bash scripting (rövid ismétlés)
Mivel a tárgy Msc hallgatóknak készült, ezért feltételezzük az Operációs rendszerek kurzus gyakorlati tudásának legalább részleges meglétét. 
Amennyiben számodra ismeretlen teljesen a Linux és annak világa, vagy csak ismételnél egy nagyot, következő oktató videókat ajánljuk:

- Ubuntu alapismeretek: https://www.youtube.com/watch?v=ROjZy1WbCIA
- Shell scripting alapismeretek: https://www.youtube.com/watch?v=v-F3YLd6oMw
## Shebang (#!)
A shebang az első sor egy Bash szkriptben, és megmondja a rendszernek, hogy melyik értelmezőt használja. A Bash szkriptek esetén általában így néz ki:<br>
__#!/bin/bash__
## Változók
Változók létrehozása értékadással:<br>
```shell
name="John"
```
Hogy ez a változó használható legyen az Bash által indított programokban vagy szkriptekben (egy fajta öröklődésnek is tekinthető módon), az export kulcsszót kell használni.
```shell
export name
```
A változó értékét a $ szimbólum segítségével lehet elérni:
```shell
echo "Hello, $name!"
```
## Fájl és navigációs műveletek
Leggyakoribbak: cd, touch, rm, mv, cp, és cat.
## if...else
A feltételes utasítások lehetővé teszik döntések meghozatalát a szkriptben:
```shell
if [ "$age" -ge 18 ]; then
 echo "You are an adult"
else
 echo "You are not an adult"
fi
```
## Aritmetikai műveletek
A (( )) segítségével lehet aritmetikai műveleteket végrehajtani:
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
exampleArray=("this" "is" "it")
echo "First element: ${exampleArray[0]}"
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
 ((counter++))
done
```
## Függvények
Függvények definiálása szokásos módon történik, annyi különbséggel hogy nincs argumentum listája. Ha szeretnénk bemeneti argumentumokat, $1 $2... stb. változókat tudjuk használni.
```shell
function greet() {
 echo "Hello, $1!"
}

greet "Alice"
```
## Parancssori argumentumok
Akár csak a függvények esetén:
```shell
#!/bin/bash
# File name: runthis.sh
echo "First arg: $1"
echo "Second arg: $2"
```
Szkript fájl futtatása:
```shell
./runthis.sh first second
```
## Bemenet és kimenet átirányítása
A Bash lehetővé teszi a bemenet és kimenet átirányítását olyan szimbólumokkal, mint < a bemenet és > a kimenet számára.<br>
Bemenet átirányítása fájlból
```shell
cat < input_file.txt
```
Kimenet átirányítása fájlba (felülírás)
```shell
echo "Hello" > output_file.txt
```
Kimenet átirányítása fájlba (hozzáfűzés)
```shell
echo "World" >> output_file.txt
```
Érdemes utánanézni az stdin, stdout, stderr kifejezéseknek is.
## Pipe (|)
A pipe arra szolgál, hogy egy parancs kimenetét továbbítsa egy másiknak bemenetként.<br>
Kilistázza az összes fájlt az aktuális könyvtárban, majd továbbítja az eredményt a 'grep' parancsnak mely leszűri az eredmény a .txt fájlokra.
```shell
ls | grep ".txt"
```
## Exit code
Minden Bash parancs visszaad egy kilépési státusz kódot. Az 0 érték sikert jelent, míg a nem nulla értékek hibát jeleznek. A legutóbbi program kilépési kódját a __$?__ változóval tudjuk lekérdezni. A __return__ kulcsszóval van lehetőségünk saját visszatérési értéket adni egy-egy szkriptnek.