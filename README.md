# selfChat

```
Die Aufgabe war, eine App zu programmieren, mit der man chatten kann. Die
Konversation findet innerhalb der App statt - es gibt weder einen Server noch muss
ein Peer-to-Peer Netzwerk aufgebaut werden. Der User chattet sozusagen mit sich
selbst. Das ist nicht als skurriles Feature gedacht, sondern soll den Umfang der
Belegarbeit begrenzen.

Die Chatverläufe sollen als JSON-File persistent abgespeichert werden.
```

wichtige punkte:
 - Konversation findet innerhalb der App statt
 - es gibt keinen server, kein bluetooth, kein p2p network
 - chatverlauf als json persistent abspeichern(lokal)
 
allgemeine Struktur:
 - es gibt mehrere chats
 - ein chat besitzt 2 chat-partner (selbst und eine weitere person)
 - ein nutzer muss identifizierbar sein (UUID und Name)
 - ein chat kann gelöscht werden
 - wenn der chat gelöscht wird, wird auf die lokale Datei gelöscht
 - es gibt 3 "screens" 

![Screenshot_7](https://user-images.githubusercontent.com/49196195/151952747-c6182184-ec5d-495f-9884-0faba50b87c0.png)

Start
 - zeigt chats an
 - jeder chat partner ist ein kreis
 - jeder chat hat eine reandom assigned farbe
 - jeder chat is antippbar und öffnet den "konversations tab"

Konversation
 - zeigt den chat an 
 - Die blauen Nachrichten sind die vom User der App gesendete Nachrichten
 - die grauen Einträge die Nachrichten des Chat-Partners
 - der "send" button öffnet den "texteingabe tab"


Texteingabe
 - es gibt ein eingabefeld
 - es gibt ein send-button
 - es gibt einen switch, welche einem die möglichkeit gibt, die nachricht aus der sicht des gegenüber chatpartner zu senden!

![Screenshot_5](https://user-images.githubusercontent.com/49196195/151952784-428e152d-e13a-4b46-92bb-cfc0c9b2aecc.png)

