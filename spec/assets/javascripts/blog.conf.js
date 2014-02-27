module.exports = function(config) {
  config.set({
    basePath: '../../..',

    frameworks: ['jasmine'],

    autoWatch: true,

    preprocessors: {
      '**/*.coffee': 'coffee'
    }, 
    reporters: ['progress', 'growl'],

    files: [
      'vendor/assets/javascripts/angular.js',
      'vendor/assets/javascripts/jquery-1.11.0.min.js',
      'vendor/assets/javascripts/angular-mocks.js',
      'app/assets/javascripts/main.js.coffee',
      'app/assets/javascripts/controllers/*',
      'app/assets/javascripts/services/*',
      'spec/assets/javascripts/*_spec.js.coffee'
    ]  
  });
};