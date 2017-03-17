#!/usr/bin/env node

'use strict';

const fs = require('fs');
const path = require('path');
const args = require('minimist')(process.argv.slice(2));
const leftPad = require('left-pad');
const replace = require('replace');

let elmDir = null;
let command = null;
let fromParam = null;
let toParam = null;
let files = [];
let maxIndex = null;

function run() {
  parseCommandLineArguments();
  executeCommand();
}

function parseCommandLineArguments() {
  if (!args || !args._ || args._.length === 0) {
    printErrorAndExit('Missing mandatory arguments.');
  }
  command = args._[0];
  switch (command) {
    case 'move':
      if (args._.length < 3) {
        printErrorAndExit('Too few arguments for command move.');
      }
      fromParam = args._[1];
      toParam = args._[2];
      checkIfNumerical(fromParam, 'from');
      checkIfNumerical(toParam, 'to');
      break;
    case 'insert':
      if (args._.length < 2) {
        printErrorAndExit('Too few arguments for command insert.');
      }
      fromParam = args._[1];
      checkIfNumerical(fromParam, 'from');
      break;
    default:
      printErrorAndExit(`Unknown command: ${command}`);
      break;
  }
}

function checkIfNumerical(value, name) {
  if (typeof value !== 'number') {
    printErrorAndExit(`Argument ${name} needs to be numerical: ${value}`);
  }
}

function pad(index) {
  return leftPad(index, 3, '0');
}

function printErrorAndExit(message) {
  console.error(message);
  printHelp();
  process.exit(1);
}

function printHelp() {
  console.log('Usage:');
  console.log('    - move-lessons.js move <from> <to>: moves lesson <from> to lesson <to>');
  console.log('    - move-lessons.js insert <index>: increments the index of all lessons >= <index>');
}

/**
 * chdir to working directory and read initial directory listing.
 */
function init() {
  elmDir = path.join(__dirname, '..', 'frontend', 'elm');
  process.chdir(elmDir);
  readDirectoryListing();
  maxIndex = calculateMaxIndex();
}

function readDirectoryListing() {
  files = fs.readdirSync(elmDir);
}

function calculateMaxIndex() {
  const regex =
    new RegExp(`^(?:Lesson|Example|Solution)0*(\\d{1,3})(?:_\\d+)?(?:_\w\w)?\\.elm$`);

  let max = 0;
  files.forEach(fileName => {
    const match = regex.exec(fileName);
    if (match && match[1]) {
      let idx = parseInt(match[1]);
      max = Math.max(max, idx);
    }
  });
  return max;
}

function executeCommand() {
  init();
  switch (command) {
    case 'move':
      moveLesson(fromParam, toParam);
      break;
    case 'insert':
      insertLesson();
      break;
    default:
      printErrorAndExit(`Unknown command: ${command}`);
      break;
  }
}

function moveLesson(from, to) {
  console.log(`Moving lesson ${from} to ${to}.`);
  const foundTarget = checkIfTargetExists(to);
  if (foundTarget) {
    process.exit(1);
  }
  moveAllFilesForLesson(from, to);
}

function checkIfTargetExists(to) {
  const regex = new RegExp(`^(?:Lesson|Example|Solution)${pad(to)}(?:_\\d+)?\.elm$`);
  let foundTarget = false;
  files.forEach(fileName => {
    const match = regex.exec(fileName);
    if (match) {
      foundTarget = true;
      console.error(`Error: Target ${match[0]} exists`);
    }
  });
  return foundTarget;
}

function moveAllFilesForLesson(from, to) {
  const lessonRegex = new RegExp(`^(Lesson)(${pad(from)})(_..\.elm$)`);
  const exampleRegex = new RegExp(`^(Example)(${pad(from)})(\.elm$)`);
  const solutionRegex = new RegExp(`^(Solution)(${pad(from)})(_\\d+\.elm$)`);
  const allRegexes = [
    lessonRegex,
    exampleRegex,
    solutionRegex,
  ];

  files.forEach(fileName => {
    allRegexes.forEach(regex => {
      const match = regex.exec(fileName);
      if (match && match.length >= 2) {
        let newFileName = `${match[1]}${pad(to)}${match[3]}`;
        console.log(`${fileName} -> ${newFileName}`);
        // search & replace numbers in file
        replace({
          regex: (from + 1),
          replacement: (to + 1),
          paths: [ fileName ],
          recursive: false,
          silent: true,
        });
        replace({
          regex: from,
          replacement: to,
          paths: [ fileName ],
          recursive: false,
          silent: true,
        });
        // actually rename file
        fs.renameSync(fileName, newFileName);
      }
    });
  });
}

function insertLesson() {
  console.log(`insert ${fromParam}, max index: ${maxIndex} `);
  for (var i = maxIndex; i >= fromParam; i--) {
     moveLesson(i, i + 1);
     readDirectoryListing();
  }
}

run();
