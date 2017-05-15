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
  var example001 = require('../elm/Example001');
  console.log('example001', Object.keys(example001));
  var lesson001 = require('../elm/Lesson001_en');
  console.log('lesson001', Object.keys(lesson001));
  var example002 = require('../elm/Example002');
  console.log('example002', Object.keys(example002));
  var lesson002 = require('../elm/Lesson002_en');
  console.log('lesson002', Object.keys(lesson002));
  var Elm = {};

  var maxLessonIndex = 999;
  var languages = ['en', 'de'];
  var defaultLanguage = 'en';
  var activeLanguage = defaultLanguage;
  var currentLesson = null;

  // Define which Elm module controls which DOM node.
  var lessons = [];
  for (var i = 1; i <= maxLessonIndex; i++) {
    var index = leftPad(i, 3, '0');
    var exampleModule = Elm['Example' + index];
    var lessonModules = findLessonModules(index);
    if (!exampleModule && !lessonModules[defaultLanguage]) {
      // neither Example nor Lesson Elm module exists, ignore this index
      continue;
    } else if (!exampleModule) {
      console.warn('Lesson module without example for index: ', index);
      continue;
    } else if (!lessonModules[defaultLanguage]) {
      console.warn(
        'Example module without lesson (' + defaultLanguage +
        ') for index: ', index);
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
    var lessonDivIds = {};
    languages.forEach(function(lang) {
      lessonDivIds[lang] = createLessonDivId(index, lang);
    });

    lessons.push(
      { idx: i
      , index: index
      , outputModule: exampleModule
      , outputDivId: createOutputDivId(index)
      , lessonModules: lessonModules
      , lessonDivIds: lessonDivIds
      , navDivId: createNavDivId(index)
      , solutionDefinitions: solutionDefinitions
      }
    );
  }

  var outputParentDiv = findNode('output');
  var lessonsParentDiv = findNode('lessons');
  var navParentDiv = findNode('navigation');
  var solutionsParentDiv = findNode('solutions');

  initLanguage();

  var solutionsContainer = findNode('solutions-container');
  if (areSolutionsToBeRendered()) {
    solutionsContainer.style.display = 'block';
  } else {
    solutionsContainer.style.display = 'none';
  }

  // Embed all modules in their respective div.
  lessons.forEach(function(definition) {
    if (!definition.outputModule) {
      console.error('Inconsistent lesson definition, no output module: ',
        definition.index);
      return null;
    }
    if (!definition.lessonModules || 
        !definition.lessonModules[defaultLanguage]) {
      console.error('Inconsistent lesson definition, no lesson modules: ',
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

    languages.forEach(function(lang) {
      if (definition.lessonModules[lang]) {
        var lessonNode = document.createElement('div');
        lessonNode.id = definition.lessonDivIds[lang];
        lessonsParentDiv.appendChild(lessonNode);
        // associate Elm lesson module with DOM node
        definition.lessonModules[lang].embed(lessonNode);
        // hide all nodes initially
        lessonNode.style.display = 'none';
      } else {
        delete definition.lessonDivIds[lang];
      }
    });

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
      solutionNode.style.display = 'none';

      var solutionLabelNode = document.createElement('div');
      solutionLabelNode.className = 'solution-label';
      solutionLabelNode.innerHTML =
        '<span class="solution-label">Solution ' + solutionDefinition.label + '</span>';
      solutionNode.appendChild(solutionLabelNode);

      var solutionOutputNode = document.createElement('div');
      solutionNode.appendChild(solutionOutputNode);
      solutionDefinition.module.embed(solutionOutputNode);
    });

    findNode('lang-en').onclick = function(event) {
      setLanguage('en');
      event.stopPropagation();
      event.preventDefault();
    };

    findNode('lang-de').onclick = function(event) {
      setLanguage('de');
      event.stopPropagation();
      event.preventDefault();
    };
  });

  function findLessonModules(index) {
    var lessonModules = {};
    languages.forEach(function(lang) {
      var langUpper = lang.charAt(0).toUpperCase() + lang.slice(1);
      var module = Elm['Lesson' + index + langUpper];
      if (module) {
        lessonModules[lang] = module;
      }
    });
    return lessonModules;
  }

  function createOutputDivId(index) {
    return 'output-' + index;
  }

  function createLessonDivId(index, lang) {
    return 'lesson-' + index + '-' + lang;
  }

  function createNavDivId(index) {
    return 'nav-' + index;
  }

  function findNode(divId) {
    var node = document.getElementById(divId);
    if (!node) {
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

  function activateLessonByIndex(index) {
    var lessonDefinition = findLessonByIndex(index);

    if (!lessonDefinition) {
      return;
    }
    activateLesson(lessonDefinition);
  }

  function activateLesson(lessonDefinition) {
    currentLesson = lessonDefinition;

    // hide all other lessons
    lessons.forEach(function(definition) {
      hideNode(definition.outputDivId);
      languages.forEach(function(lang) {
        hideNode(definition.lessonDivIds[lang]);
      });
      findNode(definition.navDivId).parentElement.className = '';
      definition.solutionDefinitions.forEach(function(solutionDefinition) {
        hideNode(solutionDefinition.key);
      });
    });

    // show new lesson
    showNode(currentLesson.outputDivId);
    console.log(activeLanguage);
    var lessonDiv = currentLesson.lessonDivIds[activeLanguage];
    if (!lessonDiv) {
      lessonDiv = currentLesson.lessonDivIds[defaultLanguage];
      showNode('sorry-not-translated');
    } else {
      hideNode('sorry-not-translated');
    }
    showNode(lessonDiv);
    findNode(currentLesson.navDivId).parentElement.className = 'active';
    currentLesson.solutionDefinitions.forEach(function(solutionDefinition) {
      showNode(solutionDefinition.key);
    });

    // save active lesson index
    localStorage.setItem('active-index', lessonDefinition.index);

    // scroll to top
    findNode('navigation').scrollIntoView();
  }

  function findLessonByIndex(index) {
    for (var lessonIdx = 0; lessonIdx < lessons.length; lessonIdx++) {
      if (lessons[lessonIdx].index === index) {
        return lessons[lessonIdx];
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

  function initLanguage() {
    activeLanguage =
      localStorage.getItem('active-language') || defaultLanguage;
    localStorage.setItem('active-language', activeLanguage);
    showActiveLanguage(activeLanguage);
  }

  function setLanguage(lang) {
    activeLanguage = lang;
    localStorage.setItem('active-language', lang);
    activateLesson(currentLesson);
    showActiveLanguage(lang);
  }

  function showActiveLanguage(lang) {
    languages.forEach(function(l) {
      findNode('lang-' + l).className = '';
    });
    findNode('lang-' + lang).className = 'active';
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
      return localStorage.getItem('show-solutions') === 'true';
    }
  }

  findNode('hide-solutions').onclick = function() {
    localStorage.setItem('show-solutions', false);
    solutionsContainer.style.display = 'none';
  };

  window.onhashchange = function() {
    var newIndex = getIndexFromUrl();
    if (newIndex) {
      activateLessonByIndex(newIndex);
    }
  };

  var initialLessonIndex =
    getIndexFromUrl() ||
    localStorage.getItem('active-index') || 
    '001';
  activateLessonByIndex(initialLessonIndex);

  if (window.location.hash !== '/#' + initialLessonIndex) {
    history.pushState(null, null, '/#' + initialLessonIndex);
  }

})();

