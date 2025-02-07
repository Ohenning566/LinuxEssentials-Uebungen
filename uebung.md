# Übungen linux essentials


## 05 Variablen in Linux

### 1. Einfache Variable setzen und ausgeben

Setze eine Variable `name` mit deinem Namen als Wert und gib sie mit `echo` aus.

>`name=Halo`  
>`$name`

### 2. Variable in einer anderen Shell nutzen

Setze eine Variable `test_var` und überprüfe, ob sie in einer komplett neu gestarteten Shell oder in einer Subshell 
verfügbar ist.

>*nein*

### 3. Umgebungsvariable exportieren

Setze eine Variable `my_var` mit dem Wert `hello` und exportiere sie, sodass sie auch in Subshells verfügbar ist. 
Ist diese Variable jetzt auch in einer komplett neu gestarteten Shell verfügbar?


>`my_var=hello`  
>`export my_var`  
oder  
>`export my_var=hello`
 
### 4. Variable in einer Zeile setzen und nutzen

Setze eine Variable `greeting` mit dem Wert `Hallo` und verwende sie direkt in einem `echo`-Befehl in derselben Zeile.
--

`greeting=Hallo && echo $greeting`

### 5. Leerzeichen in Variablen

Setze eine Variable mit einem Wert, der Leerzeichen enthält, und erkläre, warum die Anführungszeichen wichtig sind.
--

`VarMitSpaces="Ein Leerzeichen"`

Space ist ein Trenner für Elemente der Kommandozeile 

### 6. Zulässige Zeichen in Variablen

Ist es möglich, folgende Namen für Variablen zu erstellen:
```bash
meine variable
meine-variable
1variable
variable?
variable!
var*iable
```
Welche Zeichen sind in Variablennamen denn zulässig bzw. nicht zulässig?
--

nein

zulässig lediglich alphanum + _

erster Char darf keine Zahl sein 

### 7. Escpaping

Setze eine Variable `somestring`, die folgende Wert haben soll: `Ich bin der Inhalt der Variablen 'somestring'`. 
Gibt es dafür nur eine Möglichkeit oder mehrere?
--

`somestring="Ich bin der Inhalt der Variablen 'somestring'"`

`somestring=Ich\ bin\ der\ Inhalt\ der\ Variablen\ \'somestring\'`

### 8. Variablen in Variablen

Erstellt eine Variable namens `mein_home` und weise ihr den Wert der Umgebungsvariable `HOME` zu.
--

`mein_home=$HOME`


### 9. Verkettung von Variablen

Erstellt eine Variable namens `vorname` und weist ihr euren Vornamen zu. Erstellt eine weitere Variable 
namens `nachname` und weist ihr eueren Nachnamen zu. Erstelle eine dritte Variable namens `voller_name` 
welche euren Vornamen und Nachnamen durch ein Leerzeichen getrennt enthalten soll.
--

`vorname=Linus`

`nachname=Torvalds`

`voller_name="$vorname $nachname"`


### 10. Kombination von Variablen und Text

Erstellt eine Variable `betriebssystem` mit dem Wert `Linux` und eine weitere Variable `wahnsinn`, 
welcher ihr einen Wert wie `super`, `megagut`, `einfach nur klasse` oder `super logisch und eigentlich ganz einfach` 
zuweist. Lasst euch mit echo nun folgendes ausgeben: `Ich nutze <betriebssystem> und es ist einfach <wahnsinn>.`. 
Datei sollen natürlich die Variablen genutzt und durch ihren Wert ersetzt werden.
--

`betriebssystem=Linux`

`wahnsinn="ganz gut"`

`echo "Ich nutze $betriebssystem und es ist einfach $wahnsinn."` 

### 11. Länge einer Variablen ermitteln

Setze eine Variable `text` mit einem beliebigen Wert und gib deren Länge aus.
--

`text=123456789`

`echo ${#text}`

### 12. Teilstring einer Variable extrahieren

Setze eine Variable `string` mit dem Wert `Linux-Scripting` und extrahiere nur das Wort `Linux`.
--

`string=Linux-Scripting`

`echo ${string:0:5}`

### 13. Inhalt einer Variable ändern
Setze eine Variable `counter` auf `1`, erhöhe sie um `1` und gib den neuen Wert aus.
--

`counter=1`

`counter=$(( $counter+1 )) && echo $counter`

### 14. Variable mit aktuellem Datum

Setzt eine Variable mit dem Namen `aktuelles_datum` und weist ihr das aktuelle Dateum zu. 
Nutzt dafür das Kommando `date`. Versucht also, der Variablen die Ausgabe des Kommandos `date` zuzuweisen. 
Versucht es mal wie folgt: `aktuelles_datum=date`. Das wird nicht funktionieren. 
Warum? Wie könnt ihr das trotzdem erreichen?
--

`aktuelles_datum=$(date)`

`echo aktuelles_datum`

### 15. Mathematische Operationen mit Variablen

Erstellt zwei Variablen `zahl1` und `zahl2` und weist ihnen beliebige Zahlenwerte zu. 
Führt nun eine Addition der beiden Variablen durch und speichert das Ergebnis in einer neuen Variable namens `summe`. 
Gebt den Wert der Variablen `summe` auf der Konsole aus.
--

`z1=4`

`z2=3`

`summe=$(( $z1+$z2 ))`

`echo $summe`

### Hinweise

Weitere Informationen zu Variablen findet ihr in der Manpage der BASH unter der Rubrik `Parameter Expansion`. Der reguläre Ausdruck für die Suche ist `^ *Parameter Expansion *$`. Für andere Übung müsst ihr die Manpage vielleicht noch ein klein wenig weiter lesen. Schaut euch doch auch mal die Rubriken `Commando Substitution` und `Arithmetic Expansion` an.
