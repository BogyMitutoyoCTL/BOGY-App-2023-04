# Android Timer App
## Donnerstag 30.3.2023

### Vereinfachung des Datenaustauschs

Wir haben darauf verzichtet, die Daten eines StatefulWidget an seinen State durchzureichen. Stattdessen geben wir die Daten nur noch an das Widget und greifen dann im State mittels `widget.data` auf die Daten zu.

Für die Subwidgets haben wir eigene Datenklassen erstellt und Logik ergänzt, damit diese Daten auch benutzt werden.

### Notifications auf dem Sperrbildschirm

Um Nachrichten über abgelaufene Timer auf dem Sperrbildschirm anzuzeigen haben wir eine Bibliothek installiert (`pubspec.yaml`):

```
flutter_local_notifications: ^9.7.0
```

Dazu muss auch in der Datei `android\app\src\main\AndroidManifest.xml` folgendes eingetragen werden:

```xml
<!-- Permissions options for the `notification` group -->
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

### App Icon



## Mittwoch 29.3.2023

Wir haben weitere Widgets programmiert, die Themes angepasst und schon erste Sub-Widgets erstellt.

Wir haben die Daten an die Widgets durchgereicht, damit diese irgendwann die echten Daten anzeigen können.

### Fehlermeldung beim Bauen des APK

Falls diese Fehlermeldung beim Bauen des APKs (Menü: Build / Flutter / Build APK) erscheint:

```
Running Gradle task 'assembleRelease'...                        

FAILURE: Build failed with an exception.

* What went wrong:
The supplied javaHome seems to be invalid. I cannot find the java executable. Tried location: C:\Program Files\Android\Android Studio\jre\bin\java.exe
```

dann hilft folgende Vorgehensweise:

1. Windows Kommandozeile als Administrator starten
2. `cd /d C:\Program Files\Android\Android Studio`
3. `ren jre jre_old`
4. `mklink /D jre jbr`

## Dienstag 28.3.2023

Wir haben mit der Implementierung von Widgets weitergemacht.

### Speichern von Daten als JSON

Wir Betreuer haben festgestellt, dass unser Wissen über Dart schon wieder veraltet ist. Das alte `flutter generate` wurde mittlerweile durch `dart pub run build_runner` ersetzt. Das ist allerdings auch schon wieder veraltet und heißt nun `dart run build_runner build`. Mit dem Befehl werden dann Teile von Klassen automatisch generiert.

Klassen, die als JSON gespeichert werden sollen, brauchen:

* das Paket `import 'package:json_annotation/json_annotation.dart';` 

* einen anderen, automatisch generierten Teil der Klasse `part 'Klassenname.g.dart';`

* direkt oberhalb der Klasse `@JsonSerializable(explicitToJson: true, includeIfNull: true)` 

* ```dart
  @override
  String toString() => toJson().toString();
  
  factory Klassenname.fromJson(Map<String, dynamic> json) => _$KlassennameFromJson(json);
  
  Map<String, dynamic> toJson() => _$KlassennameToJson(this);
  ```

Nach diesen Änderungen muss der Befehl `dart run build_runner build` ausgeführt werden, um die Datei `Klassenname.g.dart` zu erzeugen, die mit Punkt 2 der obigen Liste eingebunden wird.

### Versionsnummern in pubspec.yaml

`^` bedeutet: es sind auch alle neueren Versionen dieser Bibliothek zugelassen, die garantiert rückwärtskompatibel mit dieser Version sind.

`>=` bedeutet: diese Version oder neuer

### Themes

Bei der Erstellung von Themes ist uns aufgefallen, dass die Hintergrundfarbe des Themes nicht angewandt wurde. Als Lösung haben wir die Eigenschaft `scaffoldBackgroundColor` gefunden.

### Navigation

Neben `.push(...)` und `.pop()` haben wir noch `pushReplacement(...)` entdeckt, das verhindert, dass man z.B. wieder zum Splashscreen zurück navigieren kann.

### Flutter Upgrade

Manche Betreuer mussten eine bestehende Flutter Installation mit `flutter upgrade --force` aktualisieren.

## Montag 27.3.2023

Nach einigen organisatorischen Dingen wie z.B. der Bestellung von Mittagessen haben wir das Widget von Folie 26 fertiggestellt, Navigation eingebaut und gelernt, wie wir Daten von einem Widget zum nächsten transferieren.

Um unsere Arbeit zu vereinfachen, haben wir uns ein paar Live Templates erstellt:

* Wir haben das Live Template `stless` so modifiziert, dass wir in Zukunft automatisch ein Scaffold, eine AppBar und eine Column bekommen.

* Wir haben uns Live Templates für TextField und den dazugehörigen TextEditingController angelegt.

Damit wir eine grobe Vorstellung haben, was wir diese Woche programmieren müssen, haben wir zunächst die Widgets von Hand gezeichnet.

Folgende Widgets haben wir identifiziert:

* SplashScreen mit dem Logo unserer App
* Startbildschirm (Main menu)
  * Button für Einstellungen
  * Button für Benutzerprofile (?)
  * Navigation zu den verfügbaren Kategorien
* Widget für Einstellungen
  * Dark Mode / Light Mode
  * Spende ans Entwicklerteam
* Widget für Benutzerprofile (?)
  * ?
* Anzeige der verfügbaren Kategorien
  * Liste der Kategorien
  * je Button zum Löschen einer Kategorie
  * je 1 Button zum Editieren einer Kategorie (Bleistift Icon)
  * 1 Button zum Anlegen eines neuen Timers
* Anlegen/Bearbeiten eines Timers
  * Textfeld zum Eingeben des Namens des Timers
  * Auswahl oder Eingabe der Kategorie für diesen Timer
  * je Abschnitt 1 Eingabefeld zum Festlegen der Dauer dieses Timers
  * Textfeld für die auszuführende Aktion
  * Button zum Hinzufügen einer weiteren Dauer (zusätzlicher Abschnitt mit +/- Button)
  * Button zum Speichern
* Anzeige der Timer innerhalb einer Kategorie
  * Button zum Starten eines Timers
  * Button zum Editieren eines Timers
  * Button zum Löschen eines Timers
* Anzeige bei Ablauf eines Timers
  * Liste der abgelaufenen Timer
  * Name der auszuführenden Aktion
  * je 1 Bestätigungsbutton zum Fortsetzen bzw. Beenden des Timers
* Anzeige der aktiven Timer
  * Name und Dauer des Timers
  * Abbrechen eines Timers
* Meldungen auf dem Sperrbildschirm

Die Aufgaben zur Erstellung dieser Widgets haben wir als [Issues](issues) in Github hinterlegt.

## Mittwoch 22.3.2023

Zum Einstieg haben wir eine Dart-Aufgabe von [Codewars](https://www.codewars.com) gelöst.

Anschließend haben wir [Flutter](Flutter.pptx) wiederholt und uns nochmal ein paar Widgets angeschaut.

Wir haben und dann weitere Beispiele programmiert, die etwas fortgeschrittenere Konzepte mit Layouts benutzen. Bis Folie 26 sind wir gekommen.

## Mittwoch 15.3.2023

Wir haben heute das Thema [Dart](Dart.pptx) abgeschlossen. Neu waren:

* Lambdas
* Klassen und Objekte

Wir konnten dann mit [Flutter](Flutter.pptx) beginnen und haben uns bis Folie 8 durchgearbeitet. Die Themen waren:

* Was ist ein Widget?
* Beispiele für Widgets
* Unser erstes stateless Widget

## Mittwoch 8.3.2023

Da wir beim letzten Mal ziemlich viele Themen behandelt haben, haben wir heute nochmal eine Wiederholung durchgeführt für:

* `for`-Schleifen
* Verzweigungen
* Listen
* Methoden und Funktionen

Danach haben wir in der [Dart](Dart.pptx) weitergemacht und die nächsten Themen angeschaut:

* Named Arguments
* Scope
* Shadowing
* Callbacks

Wir sind bis Folie 70 gekommen.

## Mittwoch 1.3.2023

Nachdem wir beim letzten Mal das Android Studio installiert haben, konnten wie heute damit beginnen, uns die Programmiersprache [Dart](Dart.pptx) anzuschauen.

Dart ist von der Syntax her ähnlich zu Arduino, weswegen viele Dinge schon bekannt vorkamen.

Die behandelten die Themen:

* kurzer Überblick über unterschiedliche Programmiersprachen
* Dateiformat von Dart
* Rechtschreibprüfung in Android Studio
* Rechnen in Dart
* Bibliotheken
* Code Formatierung (Coding Guidelines)
* Strings (Texte) verarbeiten
* Code Templates
* `for`-Schleife
* Booleans (Wahrheitswerte)
* Verzweigungen
* Listen
* Maps / Dictionaries
* Methoden und Funktionen

Wir haben es heute geschafft bis Folie 51 und machen dort nächstes Mal wieder weiter.

## Mittwoch 15.2.2023

Zu Beginn des BOGYs steht natürlich die Vorstellungsrunde, damit sich die Teilnehmer des Praktikums und Betreuer kennenlernen. Direkt danach haben wir eine Führung durch das Gebäude gemacht, damit die örtlichen Gegebenheiten bekannt sind.

Nach dem üblichen Formalismus wie Besucheranmeldung haben wir zunächst einen [Überblick über die Firma Mitutoyo](Firmenpräsentation.pptx) gegeben. Außerdem haben wir einen Einblick in unsere [Studentenwohnung](Studentenwohnung.pptx) gezeigt.

Anschließend haben wir kurz die Idee der App vorgestellt, damit klar ist, wo das Praktikum hingeht: die App soll benannte, im Vorhinein definierbare Timer zur Verfügung stellen, von denen mehrere gleichzeitig gestartet werden können. 

Anwendungsbeispiele:

* Kochen
  * Eier: 5 Minuten
  * Nudeln kochen: 2 Minuten (Wasser erhitzen) + 10 Minuten (kochen)
  * Brötchen aufbacken: 3 Minuten (Herd vorheizen) + 10 Minuten (backen)
  * Pommes in der Heißluftfriteuse: 8 Minuten, dann wenden + nochmal 8 Minuten
  * Suppenmaultaschen: 2 Minuten (Wasser erhitzen) + 8 Minuten (kochen)
  * Tee ziehen lassen: 7 Minuten
  * Pizza backen: Ofen vorheizen + Pizza belegen + Pizza backen
* Sport
  * Hometrainer: 15 Minuten
  * Joggen: 20 Minuten, dann umdrehen, nochmal 20 Minuten
  * Workout: wiederholende Übungen mit Pausen dazwischen
* Haushalt
  * Waschen: 2:36 Stunden
  * Spülmaschine: 3:12 Stunden
  * Zähneputzen: 2:30 Minuten
* Kinderbetreuung:
  * Hausaufgaben machen: 45 Minuten 
  * Computer spielen oer Fernsehen: 30 Minuten
  * Fremdsprachen lernen: 15 Minuten
  * Lesen: 20 Minuten
  * Klavier spielen: 15 Minuten
* Arbeit
  * [Pomodoro](https://de.wikipedia.org/wiki/Pomodoro-Technik)-Timer: 45 Minuten + 5 Minuten Reflexion + 10 Minuten Pause
  * Lüftungs-Timer: 1:30 Stunden

Diese Uhrzeiten sollen natürlich nicht fest hinterlegt sein, sondern jeder Anwender soll seine eigenen Timer erstellen und abspeichern können.

Ideen für weitere Features:

* Am Ende des Timers einen Webhook auslösen, z.B. um ein Licht anzuschalten oder eine Discord Nachricht verschicken.

Wir haben dann [Android Studio](AndroidStudio.pptx) installiert.

Hausaufgaben für die Teilnehmer bis zum nächsten Mal:

* Fotofreigabe ausfüllen und von den Eltern unterschreiben lassen
* Unserem Discord Server beitreten, damit ihr uns Fragen stellen könnt
* Github Account anlegen und Einladung zum Repository (diesem hier) akzeptieren
