<a id="english">

Elm Workshop
============

[Zur deutschen Version](#german)

Welcome to the Elm Workshop for beginners. This workshop contains a series of hands-on exercises to get you up to speed with the [Elm](http://elm-lang.org) programming language.

This workshop is intended as a live workshop with a trainer. You might be able to work through the exercises by yourself, but this might not be the most effective way. If you would like to arrange an on-site workshop at your company or for a conference, feel free to contact <a href="mailto:bastian.krol@codecentric.de">bastian.krol@codecentric.de</a>. The workshop length and the covered topics are flexible and can be customized to your specific needs, ranging from a half day basics workshop to a multi-day in depth Elm bootcamp.

Getting started
---------------

You need to have Node.js including npm installed, see <https://nodejs.org/en/download>. You do *not* need to install Elm, this will be installed as a local npm dependency when setting up the project.

Clone this repository into a directory of your choice:

```
# via https
git clone `https://github.com/basti1302/elm-workshop.git`
# or via ssh
git clone git@github.com:basti1302/elm-workshop.git

cd elm-workshop
```

In the root directory of the repository, run
```
npm install
```

This will install (among other things) Elm 0.18 as a local dependency. It will also compile all Elm modules in the project.

Next, run

```
npm start
```

This will start the Webpack dev server in watch mode. Always keep this running while you are working on the exercises.

Go to <http://localhost:7000> and open the file `frontend/elm/Example001.elm` in an editor to start the workshop. Now you are ready to go. Have fun!


<a id="german">

Deutsche Version
================

[english version](#english)

Willkommen zum Elm Workshop für Einsteiger. Dieser Workshop enthält viele praktische Beispiele und Aufgaben, mit denen du dich mit der Programmiersprache [Elm](http://elm-lang.org) vertraut machen.

Dieser Workshop ist darauf ausgelegt, in einer Gruppe mit einem Trainer durchgeführt zu werden. Man kann die Aufgaben vermutlich auch alleine durchgehen, auch wenn das nicht die effektiveste Möglichkeit ist. Wenn du diesen Workshop in deiner Firma oder auf einer Konferenz durchführen möchtest, kannst gerne mit <a href="mailto:bastian.krol@codecentric.de">bastian.krol@codecentric.de</a> Kontakt aufnehmen. Die Länge des Workshops und die behandelten Themen sind flexibel und können auf eure individuellen Anforderungen abgestimmt werden, vom Halbtages-Grundlagen-Kurs bis zum mehrtägigen Elm-Bootcamp.

Erste Schritte
--------------

Auf deinem Rechner muss Node.js inklusive npm installiert sein, siehe <https://nodejs.org/en/download>. Elm musst du *nicht* separat installieren, es wird als lokale npm-Abhängigkeit installiert, wenn das Projekt eingerichtet wird.

Clone dieses Repository in ein Verzeichnis deiner Wahl:

```
# per https
git clone `https://github.com/basti1302/elm-workshop.git`
# oder per ssh
git clone git@github.com:basti1302/elm-workshop.git

cd elm-workshop
```

Führe im Hauptverzeichnis des Repositories folgenden Befehl aus:
```
npm install
```

Dies installiert (unter anderem) Elm 0.18 als lokale Abhängigkeit. Des Weiteren werden schon mal alle Elm-Module im Projekt kompiliert.

Führe als nächstes den folgenden Befehl aus:

```
npm start
```

Damit startest du den Webpack dev server im watch Modus. Lass diesen Prozess die ganze Zeit über laufen, während du am Workshop arbeitest.

Öffne <http://localhost:7000> in einem Browser und die Datei `frontend/elm/Example001.elm` in einem Editor. Das wars schon, jetzt kannst du loslegen. Viel Spaß!
