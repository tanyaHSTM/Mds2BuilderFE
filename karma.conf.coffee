# Karma configuration
# Generated on Thu Mar 05 2015 19:15:25 GMT-0700 (MST)

module.exports = (config) ->
  config.set(

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: ""

    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ["jasmine"]

    # list of files / patterns to load in the browser
    files: [
      # Vendor
      "./bower_components/pvdm-analytics/build/analytics.js",
      "./bower_components/jquery/dist/jquery.min.js",
      "./bower_components/angular/angular.min.js",
      "./bower_components/angular-mocks/angular-mocks.js",
      "./bower_components/angular-messages/angular-messages.min.js",
      "./bower_components/angular-sanitize/angular-sanitize.min.js",
      "./bower_components/angular-translate/angular-translate.min.js",
      "./bower_components/angular-translate-loader-static-files/angular-translate-loader-static-files.min.js",
      "./bower_components/angularjs-rails-resource/angularjs-rails-resource.min.js",
      "./bower_components/angularjs-rails-resource/extensions/snapshots.min.js",
      "./bower_components/angular-ui-router/release/angular-ui-router.min.js",
      "./bower_components/angular-file-upload/angular-file-upload.min.js",
      "./bower_components/spin.js/spin.js",
      "./bower_components/angular-validation-match/dist/angular-validation-match.min.js",
      "./bower_components/angular-locker/dist/angular-locker.min.js",
      "./bower_components/ng-idle/angular-idle.min.js",
      "./bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js",
      "./bower_components/lodash/lodash.min.js",
      "./bower_components/pvdm-directives/build/pvdm-directives.min.js",
      "./bower_components/pvdm-checklist/build/pvdm-checklist.min.js",
      "./bower_components/pvdm-notifications/build/pvdm-notifications.min.js",
      "./bower_components/pvdm-analytics/build/pvdm-analytics.min.js",
      "./bower_components/pvdm-auth/build/pvdm-auth.min.js",
      "./bower_components/pvdm-highcharts/build/pvdm-highcharts.min.js",
      "./bower_components/pvdm-icon/build/pvdm-icon.min.js",
      "./bower_components/pvdm-ssn/build/pvdm-ssn.min.js",
      "./bower_components/angular-animate/angular-animate.min.js",
      "./bower_components/angular-touch/angular-touch.min.js",
      # App
      "./src/**/*module.coffee",
      "./src/**/*.coffee",
      # Templates
      "./src/**/*.html",
      # Tests
      "./tests/unit/**/*-spec.coffee"
#      "./tests/unit/models/facility-spec.coffee"
#      "./tests/unit/components/facility-group-picker-spec.coffee"
    ]

    # Provide templates for testing
    ngHtml2JsPreprocessor:
      moduleName: "mockTemplates"
      cacheIdFromPath: (filepath) ->
        path = filepath.split("/")
        path[path.length-1]

    # list of files to exclude
    exclude: []

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors:
      "**/*.coffee": ["coffee"]
      "**/*.html": ["ng-html2js"]

    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ["progress"]

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ["Chrome"]

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false
  )
