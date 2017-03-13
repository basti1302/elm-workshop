#!/usr/bin/env node

'use strict';

const fs = require('fs');
const path = require('path');
const args = require('minimist')(process.argv.slice(2));
const leftPad = require('left-pad');

// const lessonRegex = /^Lesson(\d\d\d)\.elm$/;
// const exampleRegex = /^Example(\d\d\d)\.elm$/;
// const solutionRegex = /^Solution(\d\d\d)_(\d+)\.elm$/;

let command = null;
let from = null;
let to = null;
let files = [];

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
      from = args._[1];
      to = args._[2];
      checkIfNumerical(from, 'from');
      checkIfNumerical(to, 'to');
      from = pad(from);
      to = pad(to);
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
  console.log('    - move-lessons.js move <from> <to>');
}

function chdirAndReadFiles() {
  const elmDir = path.join(__dirname, '..', 'frontend', 'elm');
  process.chdir(elmDir);
  files = fs.readdirSync(elmDir);
}

function executeCommand() {
  chdirAndReadFiles();
  switch (command) {
    case 'move':
      moveLesson();
      break;
    default:
      printErrorAndExit(`Unknown command: ${command}`);
      break;
  }
}

function moveLesson() {
  console.log(`moving ${from} to ${to}`);
  const foundTarget = checkIfTargetExists();
  if (foundTarget) {
    process.exit(1);
  }
  moveAllFilesForLesson();
}

function checkIfTargetExists() {
  const lessonRegex = new RegExp(`^Lesson${to}\.elm$`);
  const exampleRegex = new RegExp(`^Example${to}\.elm$`);
  const solutionRegex = new RegExp(`^Solution${to}_(\\d+)\.elm$`);
  const allRegexes = [
    lessonRegex,
    exampleRegex,
    solutionRegex,
  ];

  let foundTarget = false;
  files.forEach(fileName => {
    allRegexes.forEach(regex => {
      const match = regex.exec(fileName);
      if (match) {
        foundTarget = true;
        console.error(`Error: Target ${match[0]} exists`);
      }
    });
  });
  return foundTarget;
}

function moveAllFilesForLesson() {
  const lessonRegex = new RegExp(`^(Lesson)(${from})(\.elm$)`);
  const exampleRegex = new RegExp(`^(Example)(${from})(\.elm$)`);
  const solutionRegex = new RegExp(`^(Solution)(${from})(_\\d+\.elm$)`);
  const allRegexes = [
    lessonRegex,
    exampleRegex,
    solutionRegex,
  ];

  files.forEach(fileName => {
    allRegexes.forEach(regex => {
      const match = regex.exec(fileName);
      if (match && match.length >= 2) {
        console.log(`Found: ${match[0]} ${match[1]} ${match[2]} ${match[3]}`);
        let newFileName = `${match[1]}${to}${match[3]}`;
        console.log(`${fileName} -> ${newFileName}`);
        fs.renameSync(fileName, newFileName);
      }
    });
  });
}


run();

// files.forEach(fileName => {
//   const match = /^Exercise(\d\d\d)\.elm$/.exec(fileName);
//   if (match && match.length >= 2) {
//     const exerciseIndex = match[1];
//     console.log(match[0], exerciseIndex);
//     fs.renameSync(fileName, 'Lesson' + match[1] + '.elm');
//   }
// });

