require('!style-loader!css-loader!font-awesome/css/font-awesome.min.css');
require('../scss/index.scss');

/*
This script does a few things:
- It loads all Elm modules via require, so webpack will run elm-webpack-loader
  on them and include them in the bundle.
- It embeds each module in a separate div. In a full blown SPA, you would
  typically only have one main Elm module (one entry point) and one div to embed
  it in. The setup here is an example for a different approach where you write
  smaller independent, self-contained parts in Elm and embed them into the page
  (or in multiple pages). Both approaches have their pro and cons.
- This script also handles navigation between the different examples. Again, in
  an SPA the navigation would be handled in Elm (also perfectly possible) but
  this would add some complexity to the examples that I would like to avoid for
  a beginner workshop.
*/

(function() {
  'use strict';

  // elm-webpack-loader will actually compile all modules specified via the
  // modules option in webpack config, not just frontend/elm/Main.elm.
  // Thus, all modules are available as Elm.Full.Qualified.Module.Name
  // after this require call.
  var Elm = require('../elm/Main');

  // define which Elm module controls which DOM node
  var nodesAndModules =
    [   { divId: 'main', elmModule: Elm.Main }
      , { divId: 'example001', elmModule: Elm.Example001.Main }
      , { divId: 'example002', elmModule: Elm.Example002.Main }
    ];

  // Embed all modules in their respective div.
  nodesAndModules.forEach(function(definition) {
    // fetch DOM nodes
    var elmNode = document.getElementById(definition.divId);
    if (!elmNode) {
        console.error('Node not found: ', definition.divId);
        return;
    }
    var navNode = document.getElementById('nav-' + definition.divId);
    if (!navNode) {
      console.error('Node not found: ', 'nav-' + definition.divId);
      return;
    }

    // associate Elm module with DOM node
    definition.elmModule.embed(elmNode);
    // hide all nodes initially
    elmNode.style.display = 'none';

    // register nav click listener
    navNode.onclick = function() {
      nodesAndModules.forEach(function(definition) {
        document.getElementById(definition.divId).style.display = 'none';
      });
      elmNode.style.display = 'block';
      localStorage.setItem('active-div', definition.divId);
    };
  });

  var lastActiveDiv = localStorage.getItem('active-div') || 'main';
  document.getElementById(lastActiveDiv).style.display = 'block';
})();

