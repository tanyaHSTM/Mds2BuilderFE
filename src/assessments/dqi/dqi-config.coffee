'use strict'

angular

  .module("pvdm.assessments.dqi")

  .config( ($stateProvider, $urlRouterProvider, PATHS) ->

    $urlRouterProvider
      .when("", PATHS.START_PAGE)
      .when("/", PATHS.START_PAGE)

    $stateProvider
      .state('assessments:dqi',
        parent: 'layout:primary'
        url: '/assessments/dqi_form'
        templateUrl: 'dqi-form.html'
        controller: 'dqi.controllers.collection as dqiCtrl'
      )
  )