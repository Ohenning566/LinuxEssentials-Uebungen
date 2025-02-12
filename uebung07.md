# Übungen zur Kompression unter Linux

## Vorbereitung

Folgende Kommandos werden für die Übungen benötigt:
```bash
dd
tar
gzip
bzip2
xz
time
```

Erstelle für die Übungen mehrere Testdateien mit dem Kommando `dd` nach folgendem Schema:
```bash
dd if=/dev/zero of=bigfile1.data bs=1M count=1024
dd if=/dev/random of=bigfile2.data bs=1M count=1024
```
**Erklärung:** `dd` liest hier von der Gerätedatei `/dev/zero/` 1024 Blöcke mit Nullbytes zu je 1MB ein und erstellt daraus die Datei `bigfile1.data` im aktuellen Verzeichnis.

### 1. Komprimieren einzelner Dateien ohne Tar
Verwende `gzip`, `bzip2` und `xz`, um eine einzelne Datei direkt zu komprimieren. 

1. Welche Unterschiede gibt es im Verhalten und in der Handhabung beim Entpacken?  
> gzip/bzip2 < Datei > komprimiert die Datei ohne eine Kopie der orginalen Datei zu behalten  
> die Option `-c` lässt eine Umleitung der Ausgabe zu  
2. Messt mit dem Kommando `time` wie lange die einzelenen Komprimierungsalgorithmen zur Komprimierung und auch de-komprimierung benötigen.
```bash
time <kommando>
```

 Bigfile ~ 1 GiB z=zeros , r=random  

| Kommando | Zeit |
|----------|-----:|
| `gzip bigfile_r.data` |	`46,605 s` |
| `gzip bigfile_z.data 	     |    9,065 s` |
`| gunzip bigfile_r.data.gz   |    9,792s |` 
| gunzip bigfile_z.data.gz   |    6,407s | 

| Kommando | Zeit |
|----------|-----:|
| bzip2 bigfile_r.data      |  3m10,476s | 
| bzip2 bigfile_z.data      |  0m12,713s | 
| bunzip2 bigfile_r.data.bz2 | 1m53,027s | 
| bunzip2 bigfile_z.data.bz2 |    5,099s | 

| Kommando | Zeit |
|----------|-----:|
| xz -e bigfile_r.data 	  |   10m54,508s | 
| xz -e bigfile_z.data    |      51,437s | 
| unxz  bigfile_r.data.xz |       5,820s | 
| unxz  bigfile_z.data.xz |       1,908s | 


3. Wie gross sind die resultierenden Dateien? 
```bash
ls -lh <datei>
du -h <datei>
```

```
~/Work/Ueb07$ ls -lh
 1,0G 11. Feb 11:35 bigfile_r.data
 1,1G 11. Feb 11:35 bigfile_r.data.bz2
 1,1G 11. Feb 11:07 bigfile_r.data.gz
 1,1G 11. Feb 11:35 bigfile_r.data.xz
 1,0G 11. Feb 11:24 bigfile_z.data
  785 11. Feb 11:24 bigfile_z.data.bz2
1018K 11. Feb 11:32 bigfile_z.data.gz
 153K 11. Feb 11:24 bigfile_z.data.xz

~/Work/Ueb07$ du *
1048580 bigfile_r.data
1053208 bigfile_r.data.bz2
1048752 bigfile_r.data.gz
1048632 bigfile_r.data.xz
1048580 bigfile_z.data
4       bigfile_z.data.bz2
1020    bigfile_z.data.gz
156     bigfile_z.data.xz

```

4. Was schliesst ihr daraus bezüglich der einzelenen Algorithmen?

> Gzip ist am wenigsten effektiv, offenbar das älteste Programm.  
> Bzip2 ist offenbar auf maximale Kompression optimiert,  
> xz ist auf Entpackgeschwindigkeit optimiert.  

### 2. Erstellen eines Tar-Archivs ohne Kompression
Erstelle ein Tar-Archiv `backup.tar`, das alle Dateien aus dem aktuellen Verzeichnis enthält.

> Lösung im Sinne der Aufgabe: tar -cf ../backup.tar && mv ../backup.tar .  
> tar -cf backup.tar *.data  

### 3. Erstellen eines komprimierten Tar-Archivs mit gzip
Erstellt ein gzip-komprimiertes Archiv `backup.tar.gz` aus dem aktuellen 
Verzeichnis und überprüfe die Dateigröße. Dazu könnt ihr natürlich das in Übung 2 
erstellte Archiv einfach mit `gzip` komprimieren. Das sind aber zwei Schritte, die 
durchgeführt werden müssen. Vielleicht geht das ja auch in einem Schritt. Kann 
`tar` das etwa direkt? Sucht doch in der Manpage von `tar` mal nach dem Stichwort 
`Compression`.

> gzip -k bigfile.tar  
> 1,1G 11. Feb 15:10 bigfile.tar.gz  
>   
> tar -czvf bigfile.tar.gz *.data    

### 4. Erstellen eines komprimierten Tar-Archivs mit bzip2
Erstellt ein bzip2-komprimiertes Archiv `backup.tar.bz2`, welches auch die 
drei `bigfile` Dateien enthalten soll in einem Rutsch mit `tar` und vergleicht 
die Dateigröße mit der gzip-Version.

> bzip2 -k bigfile.tar  
> 1,1G 11. Feb 15:10 bigfile.tar.bz2  
>   
> tar -cjvf bigfile.tar.bz2 *.data   

### 5. Erstellen eines komprimierten Tar-Archivs mit xz
Erstelle ein xz-komprimiertes Archiv `backup.tar.xz` und vergleiche die 
Dateigröße mit gzip und bzip2.

> xz -k bigfile.tar  
> 1,1G 11. Feb 15:10 bigfile.tar.xz  
>   
> tar -cJvf bigfile.tar.xz *.data   


```
1078496661 11. Feb 15:10 bigfile.tar.bz2
1074958785 11. Feb 15:10 bigfile.tar.gz
1073952600 11. Feb 15:10 bigfile.tar.xz
```



### 6. Dekomprimieren eines gzip-Archivs
Entpackt die einzelnen Archive und überprüft den Inhalt.

### 7. Fehlersuche: Doppelte Kompression
Was passiert, wenn du eine Datei mit `gzip` komprimierst und anschließend das komprimierte Ergebnis 
erneut mit `gzip` bearbeitest?

>  

### 8. Fehlersuche: Falsche Dateiendung
Was passiert, wenn du eine Datei mit `bzip2` komprimierst, sie aber fälschlicherweise mit `tar -xf` entpacken 
möchtest? Wie kannst du den Fehler erkennen und beheben?

> *tar -xf bigfile.tar.bz2* --verbose  
> wenn die bzip-Datei ein tar enthält, wird entkomprimiert und ausgepackt.  


### 9. Entpacken ohne ursprüngliches Format zu kennen
Wie kannst du eine komprimierte Datei entpacken, ohne zu wissen, welches Kompressionsformat verwendet wurde?

> 1a. file bigfile_r.data.bz2   
> 1b. file bigfile.tar.bz2  
> 2. "richtigen (ent)packer wählen"  
>>  2a bunzip2 bigfile_r.data.bz2  
>>  2b tar -xvjf bigfile.tar.bz2  


### 10. Versuch, ein Verzeichnis mit gzip, bzip2 oder xz zu komprimieren
Versuche, ein Verzeichnis direkt mit `gzip`, `bzip2` oder `xz` zu komprimieren, ohne `tar`. 
Warum funktioniert das nicht direkt, und wie kannst du es richtig machen?

>  

### 12. Komprimierung mit zip
Erstelle ein ZIP-Archiv `backup.zip`, das alle Dateien eines Verzeichnisses enthält. 
Wie unterscheidet sich das Verhalten von `zip` im Vergleich zu `tar` mit gzip? 
Du kannst auch hier die Kompressionsgeschwindigkeit und resultierende Dateigrösse vergleichen.

Hierzu müsst ihr `zip` erstmal installieren. Als `root` mit `apt install zip`
