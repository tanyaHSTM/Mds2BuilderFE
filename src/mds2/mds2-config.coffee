'use strict'

angular

  .module("pvdm.mds2")

  .config( ($stateProvider, $urlRouterProvider, PATHS) ->

    $urlRouterProvider
      .when("", PATHS.START_PAGE)
      .when("/", PATHS.START_PAGE)

    $stateProvider
      .state('mds2',
        parent: 'layout:primary'
        url: '/mds2'
        templateUrl: 'mds2.html'
        controller: 'mds2.controller as mds2Ctrl'
      )
  )