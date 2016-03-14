'use strict'

angular

  .module("pvdm.assessments.dqi")

  .config( ($stateProvider, $urlRouterProvider, PATHS) ->

    $urlRouterProvider
      .when("", PATHS.START_PAGE)
      .when("/", PATHS.START_PAGE)

    $stateProvider
      .state('dqi',
        parent: 'layout:primary'
        url: '/dqi'
        templateUrl: 'dqi-form.html'
        controller: 'dqi.controllers.collection as dqiCtrl'
      )

    .state('dqi.single', 
        url: '/single',
        templateUrl: 'single.html',
    )

    .state('dqi.batch',
        url: '/batch',
        templateUrl: 'batch.html'
    )
    .state('dqi.records',
        url: '/records',
        templateUrl: 'records.html'
    )
  )