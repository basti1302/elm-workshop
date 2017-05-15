var elmCompiler = require('node-elm-compiler');

function ElmMultipleModulesPlugin(options) {
  // Setup the plugin instance with options...
  console.log('ElmMultipleModulesPlugin', options);
}

ElmMultipleModulesPlugin.prototype.apply = function(compiler) {
  console.log('ElmMultipleModulesPlugin#apply');
  compiler.plugin('emit', function(compilation, callback) {
    console.log('ElmMultipleModulesPlugin#emit');
    console.log('ElmMultipleModulesPlugin#modules', compilation.modules[0].request);
    console.log('ElmMultipleModulesPlugin#modules', compilation.modules[0].fileDependencies);
    compilation.chunks.forEach(function(chunk) {
      chunk.modules.forEach(function(module) {
        if (module.fileDependencies) {
          module.fileDependencies.forEach(function(filepath) {
            if (filepath && filepath.endsWith('.elm')) {
              console.log(filepath);
            }
          });
        }
      });
    });
  });
};

module.exports = ElmMultipleModulesPlugin;
