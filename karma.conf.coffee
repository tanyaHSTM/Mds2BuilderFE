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
      "./bower_components/jquery/dist/jquery.min.js",
      "./bower_components/messageformat/messageformat.js",
      "./bower_components/angular/angular.js",
      "./bower_components/angular-mocks/angular-mocks.js",
#       "./bower_components/angular-google-analytics/dist/angular-google-analytics.js",
      "./bower_components/angular-cookies/angular-cookies.js",
      "./bower_components/angular-messages/angular-messages.js",
      "./bower_components/angular-sanitize/angular-sanitize.js",
      "./bower_components/angular-translate/angular-translate.js",
      "./bower_components/angular-translate-loader-static-files/angular-translate-loader-static-files.js",
      "./bower_components/angular-translate-interpolation-messageformat/angular-translate-interpolation-messageformat.js",
      "./bower_components/angular-translate-storage-local/angular-translate-storage-local.js",
      "./bower_components/angular-translate-storage-cookie/angular-translate-storage-cookie.js",
      "./bower_components/angularjs-rails-resource/angularjs-rails-resource.js",
      "./bower_components/angular-ui-router/release/angular-ui-router.js",
      "./bower_components/angular-file-upload/dist/angular-file-upload.min.js",
      "./bower_components/angular-validation-match/dist/angular-validation-match.js",
      "./bower_components/angular-locker/dist/angular-locker.js",
      "./bower_components/angularUtils-pagination/dirPagination.js",
      "./bower_components/autofill-event/src/autofill-event.js",
      "./bower_components/angular-bootstrap/ui-bootstrap-tpls.js",
      "./bower_components/ng-idle/angular-idle.js",
      "./bower_components/lodash/lodash.js",
      "./bower_components/spin.js/spin.js",
      "./bower_components/moment/moment.js",
      "./bower_components/angular-animate/angular-animate.js",
      "./bower_components/angular-touch/angular-touch.js",
      "./bower_components/re-tree/re-tree.js",
      "./bower_components/ng-device-detector/ng-device-detector.js",
      # App
      "./lib/**/*-module.coffee",
      "./src/**/*-module.coffee",
      "./lib/**/*.coffee",
      "./src/**/*.coffee"
      # Templates
      "./lib/**/*.html",
      "./src/**/*.html",
      # Tests
      "./lib/**/*-spec.coffee",
      "./src/**/*-spec.coffee"
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
