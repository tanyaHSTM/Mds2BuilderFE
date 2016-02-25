"use strict"

angular

  .module( "pvdm" )

  .config( ($httpProvider, $urlRouterProvider, $stateProvider, $compileProvider, $logProvider, $translateProvider, PATHS, MDS2) ->

    #
    # Define layouts
    layoutPrimary =
      abstract: true
      name: "layout:primary"
      template: "<pvdm-primary-layout></pvdm-primary-layout>"

    layoutTrowser =
      abstract: true
      name: "layout:trowser"
      templateUrl: "pvdm-trowser-layout.html"

    $stateProvider
      .state(layoutPrimary)
      .state(layoutTrowser)

    #
    # Routes
    $urlRouterProvider
      .otherwise("/404_error")

    #
    # Config translations
    $translateProvider
      .addInterpolation('$translateMessageFormatInterpolation')
      .useLoader("pvdmRevLocaleLoader")
      .preferredLanguage("en-us")
      .useSanitizeValueStrategy("sanitize")
      .fallbackLanguage("en-us")
      .useLocalStorage()

    #
    # Disable debug mode on "abaqis.com" domains for better performance
    if RegExp(MDS2.PRODUCTION_DOMAIN, "i").test(window.location.host)
      # Don't add angular debug params to DOM elements
      $compileProvider.debugInfoEnabled(false)
      # Disable console logging
      $logProvider.debugEnabled(false)

    #
    # Delay digest cycle when multiple async calls made to improve performance
    $httpProvider.useApplyAsync(true)

  )
