Elm Workshop
============

Welcome to the Elm Workshop for beginners. This workshop contains a series of hands-on exercises to get you up to speed with the [Elm](http://elm-lang.org) programming language.

This workshop is intended as a live workshop with a trainer. You might be able to work through the exercises by yourself, but this might not be the most effective way. If you would like to book this as an on-site workshop at your company or for a conference, feel free to contact me at <a href="mailto:bastian.krol@codecentric.de">bastian.krol@codecentric.de</a>. The workshop length and the covered topics are flexible and can be customized to your specific needs, ranging from a half day basics workshop to a multi-day in depth Elm bootcamp.

Getting started
---------------

You need to have Node.js including npm installed, see https://nodejs.org/en/download.You do *not* need to install Elm, this will be installed as a local npm dependency when setting up the project.

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

This will install (among other things) Elm 0.18 as a local dependency. It will also compile all modules in the project.

Next, run

```
npm start
```

This will start the Webpack dev server in watch mode. Always keep this running while you are working on the exercises.

Go to http://localhost:7000 and open the file `frontend/elm/Example001.elm` in an editor to start the workshop. Now you are ready to go. Have fun!

