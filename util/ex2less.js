#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const elmDir = path.join(__dirname, '..', 'frontend', 'elm');

process.chdir(elmDir);
console.log('CWD: ', process.cwd());

const files = fs.readdirSync(elmDir);

files.forEach(fileName => {
  const match = /^Exercise(\d\d\d)\.elm$/.exec(fileName);
  if (match && match.length >= 2) {
    const exerciseIndex = match[1];
    console.log(match[0], exerciseIndex);
    fs.renameSync(fileName, 'Lesson' + match[1] + '.elm');
  }
});

