# Übungen zu Textströmen und Kommando-Pipelines in Linux

> [!NOTE]
> Um an Informationen über den Aufbau der Datei `/etc/passwd` zu gelangen, könnt ihr die passende Manpage dazu mit dem Kommando `man 5 passwd` aufrufen.

## Übung 1: Anzahl der Benutzer im System ermitteln
Zählt die Zeilen in der Datei `/etc/passwd`, um die Anzahl der Benutzer zu bestimmen. Nutzt dafür das Kommando `wc`.

>  cat /etc/passwd | wc -l

1. Warum sind das so viele?  
> unterschiedl. Prozesse benötigen unterschiedliche Berechtigungen  
2. Gibt es dazu mehr als eine Möglichkeit?  
> bestimmt ;)  

## Übung 2: Bestimmten Benutzer in `/etc/passwd` suchen
Gebt mit `grep` nur die Zeile aus der `/etc/passwd` aus, in der etwas zu eurem regulären Benutzer steht.

> cat /etc/passwd | grep oliver   
>> `suche nach regulären Usern`:   
>> filter 4.feld grösser 1000  
>> cat /etc/passwd | grep :/home/  
 
## Übung 3: Nur die Benutzernamen ausgeben
Gebt mit `cut` ausschliesslich die Login-Namen der Benutzer auf dem System aus.

> cat /etc/passwd | cut -d: -f1  
> `Erweiterung der Aufgabe zu :`** regulären Benutzer**   
> cat /etc/passwd | grep :/home/ | cut -d: -f1  


## Übung 4: Die letzten 5 Zeilen der `.bashrc` ausgeben
Gebt mit `tail` nur die letzten 5 Zeilen der `.bashrc` aus.

> cat ../.bashrc | tail -n5  

## Übung 5: Die Anzahl der Shells im System ermitteln
Zählt die in `/etc/passwd` eingetragenen Shell. Wie viele verschiedene gibt es? Eventuell könnten hier die Kommandos `sort` und `uniq` nützlich sein.

