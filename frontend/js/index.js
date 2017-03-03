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

// We use the left-pad function from npm... what could possibly go wrong? ;D
var leftPad = require('left-pad');

(function() {
  'use strict';

  // We need to require one arbitrary Elm file here, to trigger
  // elm-webpack-loader. The loader will then actually compile all modules
  // specified via the modules option in webpack config, not just
  // the Elm file we mention here.
  // Thus, all modules are available as Elm.Full.Qualified.Module.Name
  // after this require call.
  var Elm = require('../elm/Example001');

  var maxExerciseIndex = 999;

  // Define which Elm module controls which DOM node.
  // To add more modules, add them to the list here and add a div in
  // index.html for them with a matching id.
  var exercises = [];
  for (var i = 1; i <= maxExerciseIndex; i++) {
    var index = leftPad(i, 3, '0');
    if (!Elm['Example' + index] && !Elm['Exercise' + index]) {
      // neither Example nor Exercise Elm module exists, ignore this index
      continue;
    } else if (!Elm['Example' + index]) {
      console.warn('Exercise modules without example for index: ', index);
      continue;
    } else if (!Elm['Exercise' + index]) {
      console.warn('Example modules without exercise for index: ', index);
      continue;
    }
    exercises.push(
      { idx: i
      , index: index
      , outputModule: Elm['Example' + index]
      , outputDivId: createOutputDivId(index)
      , exerciseModule: Elm['Exercise' + index]
      , exerciseDivId: createExerciseDivId(index)
      , navDivId: createNavDivId(index)
      }
    );
  }

  var outputParentDiv = findNode('output');
  var exercisesParentDiv = findNode('exercises');
  var navParentDiv = findNode('navigation');

  // Embed all modules in their respective div.
  exercises.forEach(function(definition) {
    if (!definition.outputModule) {
      console.error('Inconsistent exercise definition, no output module: ',
        definition.index);
      return null;
    }
    if (!definition.exerciseModule) {
      console.error('Inconsistent exercise definition, no exercise module: ',
        definition.index);
      return null;
    }

    // create DOM nodes
    var outputNode = document.createElement('div');
    outputNode.id = definition.outputDivId;
    outputParentDiv.appendChild(outputNode);
    var exerciseNode = document.createElement('div');
    exerciseNode.id = definition.exerciseDivId;
    exercisesParentDiv.appendChild(exerciseNode);
    var navLiNode = document.createElement('li');
    navParentDiv.appendChild(navLiNode);
    var navANode = document.createElement('a');
    navANode.id = definition.navDivId;
    navANode.href = '/#' + definition.index;
    navANode.textContent = definition.idx;
    navLiNode.appendChild(navANode);

    // associate Elm output module with DOM node
    definition.outputModule.embed(outputNode);
    // hide all nodes initially
    outputNode.style.display = 'none';

    // associate Elm exercise module with DOM node
    definition.exerciseModule.embed(exerciseNode);
    // hide all nodes initially
    exerciseNode.style.display = 'none';
  });

  function createOutputDivId(index) {
    return 'output-' + index;
  }

 function createExerciseDivId(index) {
    return 'exercise-' + index;
  }

  function createNavDivId(index) {
    return 'nav-' + index;
  }

  function findNode(divId) {
    var node = document.getElementById(divId);
    if (!node) {
      console.error('Node not found: ', divId);
      return null;
    }
    return node;
  }

  function hideNode(divId) {
    var node = findNode(divId);
    if (node) {
      node.style.display = 'none';
    }
  }

  function showNode(divId) {
    var node = findNode(divId);
    if (node) {
      node.style.display = 'block';
    }
  }

  function createExerciseSelectionHandler(index) {
    return function() {
      activateExercise(index);
    };
  }

  function activateExercise(index) {
    // TODO Mark nav node as not active/active
    exercises.forEach(function(definition) {
      hideNode(definition.outputDivId);
      hideNode(definition.exerciseDivId);
    });
    showNode(createOutputDivId(index));
    showNode(createExerciseDivId(index));
    localStorage.setItem('active-index', index);
  }

  function getIndexFromUrl() {
    var hash = window.location.hash;
    var result = /^#(\d\d\d)$/.exec(hash);
    if (result) {
      return result[1];
    }
    return null;
  }

  window.onhashchange = function() {
    var newIndex = getIndexFromUrl();
    if (newIndex) {
      activateExercise(newIndex);
    }
  };

  var initialExerciseIndex =
    getIndexFromUrl() ||
    localStorage.getItem('active-index') || 
    '001';
  activateExercise(initialExerciseIndex);

  if (window.location.hash !== '/#' + initialExerciseIndex) {
    history.pushState(null, null, '/#' + initialExerciseIndex);
  }
})();

