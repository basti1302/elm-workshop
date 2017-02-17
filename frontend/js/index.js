'use strict';

require('!style-loader!css-loader!font-awesome/css/font-awesome.min.css');
// require('../sass/index.scss');

var Elm = require('../elm/Main');
var node = document.getElementById('app');
var app = Elm.Main.embed(node);
