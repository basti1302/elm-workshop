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
  var exercises = [];
  for (var i = 1; i <= maxExerciseIndex; i++) {
    var index = leftPad(i, 3, '0');
    var exampleModule = Elm['Example' + index];
    var exerciseModule = Elm['Exercise' + index];
    if (!exampleModule && !exerciseModule) {
      // neither Example nor Exercise Elm module exists, ignore this index
      continue;
    } else if (!exampleModule) {
      console.warn('Exercise module without example for index: ', index);
      continue;
    } else if (!exerciseModule) {
      console.warn('Example module without exercise for index: ', index);
      continue;
    }
    var solutionDefinitions =
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      .map(function(solutionIndex) {
        var solutionKey = 'Solution' + index + '_' + solutionIndex;
        return { key: solutionKey
               , label: i + '-' + solutionIndex
               , module: Elm[solutionKey]
               };
      })
      .filter(function(solutionDefinition) {
        return !!solutionDefinition.module;
      });
    exercises.push(
      { idx: i
      , index: index
      , outputModule: exampleModule
      , outputDivId: createOutputDivId(index)
      , exerciseModule: exerciseModule
      , exerciseDivId: createExerciseDivId(index)
      , navDivId: createNavDivId(index)
      , solutionDefinitions: solutionDefinitions
      }
    );
  }

  var outputParentDiv = findNode('output');
  var exercisesParentDiv = findNode('exercises');
  var navParentDiv = findNode('navigation');
  var solutionsParentDiv = findNode('solutions');

  var solutionsContainer = findNode('solutions-container');
  if (areSolutionsToBeRendered()) {
    solutionsContainer.style.display = 'block';
  } else {
    solutionsContainer.style.display = 'none';
  }

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

    // create DOM nodes and embed Elm modules

    var outputNode = document.createElement('div');
    outputNode.id = definition.outputDivId;
    outputParentDiv.appendChild(outputNode);
    // associate Elm output module with DOM node
    definition.outputModule.embed(outputNode);
    // hide all nodes initially
    outputNode.style.display = 'none';

    var exerciseNode = document.createElement('div');
    exerciseNode.id = definition.exerciseDivId;
    exercisesParentDiv.appendChild(exerciseNode);
    // associate Elm exercise module with DOM node
    definition.exerciseModule.embed(exerciseNode);
    // hide all nodes initially
    exerciseNode.style.display = 'none';

    var navLiNode = document.createElement('li');
    navParentDiv.appendChild(navLiNode);
    var navANode = document.createElement('a');
    navANode.id = definition.navDivId;
    navANode.href = '/#' + definition.index;
    navANode.textContent = definition.idx;
    navLiNode.appendChild(navANode);

    definition.solutionDefinitions.forEach(function(solutionDefinition) {
      var solutionNode = document.createElement('div');
      solutionNode.id = solutionDefinition.key;
      solutionNode.className = 'solution-output';
      solutionsParentDiv.appendChild(solutionNode);
      // solutionNode.style.display = 'none';

      var solutionLabelNode = document.createElement('div');
      solutionLabelNode.className = 'solution-label';
      solutionLabelNode.innerHTML =
        '<span class="solution-label">Solution ' + solutionDefinition.label + '</span>';
      solutionNode.appendChild(solutionLabelNode);

      var solutionOutputNode = document.createElement('div');
      solutionNode.appendChild(solutionOutputNode);
      solutionDefinition.module.embed(solutionOutputNode);
    });
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

  function activateExercise(index) {
    var exerciseDefinition = findExerciseByIndex(index);

    if (!exerciseDefinition) {
      return;
    }

    // hide all other exercises
    exercises.forEach(function(definition) {
      hideNode(definition.outputDivId);
      hideNode(definition.exerciseDivId);
      findNode(definition.navDivId).classNames = '';
      definition.solutionDefinitions.forEach(function(solutionDefinition) {
        hideNode(solutionDefinition.key);
      });
    });

    // show new exercise
    showNode(exerciseDefinition.outputDivId);
    showNode(exerciseDefinition.exerciseDivId);
    findNode(exerciseDefinition.navDivId).classNames = 'active';
    exerciseDefinition.solutionDefinitions.forEach(function(solutionDefinition) {
      showNode(solutionDefinition.key);
    });

    // save active exercise index
    localStorage.setItem('active-index', index);
  }

  function findExerciseByIndex(index) {
    for (var exIdx = 0; exIdx < exercises.length; exIdx++) {
      if (exercises[exIdx].index === index) {
        return exercises[exIdx];
      }
    }
  }

  function getIndexFromUrl() {
    var hash = window.location.hash;
    var result = /^#(\d\d\d)$/.exec(hash);
    if (result) {
      return result[1];
    }
    return null;
  }

  function areSolutionsToBeRendered() {
    var hash = window.location.hash;
    if (hash && hash.indexOf('?enable-solutions') >= 0) {
      localStorage.setItem('show-solutions', true);
      return true;
    } else if (hash && hash.indexOf('?disable-solutions') >= 0) {
      localStorage.setItem('show-solutions', false);
      return false;
    } else {
      return !!localStorage.getItem('show-solutions');
    }
  }

  findNode('hide-solutions').onclick = function() {
    localStorage.setItem('show-solutions', false);
    solutionsContainer.style.display = 'none';
  };

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

