# Lösungen zu den Aufgaben
# Übungen zu `tar` unter Linux


## Übung 1: Einfache Archivierung
Erstelle ein Archiv aus mehreren Dateien.

1. Erstelle drei Textdateien: `file1.txt`, `file2.txt` und `file3.txt`.
2. Erstelle ein Archiv `backup.tar`, das diese drei Dateien enthält.
3. Überprüfe, ob das Archiv erfolgreich erstellt wurde.

> touch file{1..3}.txt  
> tar -cf backup.tar file1.txt file2.txt file3.txt  
> ls [-l]  

## Übung 2: Archivinhalt anzeigen
Zeige den Inhalt eines bestehenden `tar`-Archivs an.

1. Verwende das zuvor erstellte `backup.tar`.
2. Liste die enthaltenen Dateien auf.

> tar -tf archiv.tar  

## Übung 3: Archiv erweitern
Füge eine Datei zu einem bestehenden Archiv hinzu.

1. Erstelle eine neue Datei `file4.txt`.
2. Füge diese Datei zum `backup.tar`-Archiv hinzu.
3. Überprüfe, ob die Datei nun im Archiv enthalten ist.

> tar -rf archiv.tar file4.txt  

## Übung 4: Archiv extrahieren
Entpacke ein `tar`-Archiv.

1. Lösche die ursprünglichen `file1.txt`, `file2.txt`, `file3.txt` und `file4.txt`.
2. Extrahiere alle Dateien aus `backup.tar`.
3. Prüfe, ob die Dateien korrekt wiederhergestellt wurden.

> rm file{1..3}.txt  
> tar -xf archiv.tar  

## Übung 5: Einzelne Datei extrahieren
Extrahiere nur eine bestimmte Datei aus einem `tar`-Archiv.

1. Lösche nur `file2.txt`.
2. Extrahiere nur `file2.txt` aus `backup.tar`.
3. Stelle sicher, dass die anderen Dateien nicht erneut extrahiert wurden.

> rm file2.txt  
> tar -xf archiv.tar file2.tar  

## Übung 6: Archiv mit Verzeichnis erstellen
Erstelle ein Archiv, das ein ganzes Verzeichnis enthält.

1. Erstelle ein Verzeichnis `mydir` und darin einige Textdateien.
2. Erstelle ein `tar`-Archiv, das das gesamte Verzeichnis `mydir` enthält.
3. Überprüfe den Inhalt des Archivs.

> mkdir Mydir  
> touch Mydir/file{1..9}.txt  
> tar -cf archiv2.tar Mydir  

## Übung 7: Archiv mit Dateiattributen erstellen
Erstelle ein `tar`-Archiv unter Beibehaltung der Dateiattribute.

1. Setze spezielle Berechtigungen oder Zeitstempel auf einige Dateien.
2. Erstelle ein Archiv, das diese Dateien mit ihren Attributen speichert.
3. Extrahiere das Archiv und prüfe, ob die Attribute erhalten bleiben.

>  

## Übung 8: Differentielles Archiv erstellen
Erstelle ein Archiv von Dateien, die seit einer bestimmten Zeit geändert wurden.

1. Erstelle einige Dateien und ändere einige davon nach einer gewissen Zeit.
2. Erstelle ein `tar`-Archiv, das nur die geänderten Dateien enthält.
3. Überprüfe den Archivinhalt.

> touch Mydir/file9.txt  
> tar -uf archiv2.tar Mydir/* (--verbose)  
> tar -tf archiv2.tar  

## Übung 9: Beschädigtes Archiv überprüfen
Überprüfe ein `tar`-Archiv auf Fehler.

1. Erstelle ein `tar`-Archiv und Simuliere eine Beschädigung, indem du einige Bytes entfernst:
```sh
truncate -s -10 backup.tar
```
2. Versuche, es auf Fehler zu überprüfen.

> tar -tf archiv.tar   
> >> "tar: Das sieht nicht wie ein tar-Archiv aus."  
> >> "springe zum nächsten Kopfteil"  
> >> *es folgt die nächtste Datei*  

## Übung 10: Archiv ohne bestimmte Dateien erstellen
Erstelle ein Archiv, das bestimmte Dateien oder Dateitypen ausschließt.

1. Erstelle verschiedene Dateitypen (`.txt`, `.log`, `.cfg`).
2. Erstelle ein `tar`-Archiv, das alle Dateien außer `.log`-Dateien enthält.
3. Überprüfe den Inhalt des Archivs, um sicherzustellen, dass `.log`-Dateien fehlen.

> echo TestLogText > file1.log  
> echo TesConfig > config.cfg  
> mkdir ../tardir  
> tar -cf ../tardir/archiv.tar *.!(log)  
> *testen mit:*  
> tar -tf ../tardir/archiv.tar   
