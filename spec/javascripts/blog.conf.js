module.exports = function(config) {
  config.set({
    basePath: '../..',

    frameworks: ['jasmine'],

    autoWatch: true,

    preprocessors: {
      '**/*.coffee': 'coffee'
    }, 

    files: [
      'vendor/assets/javascripts/angular.js',
      'vendor/assets/javascripts/angular-mocks.js',
      'app/assets/javascripts/main.js.coffee',
      'app/assets/javascripts/controllers/*',
      'app/assets/javascripts/services/*',
      'spec/javascripts/*_spec.js.coffee'
    ]  
  });
};