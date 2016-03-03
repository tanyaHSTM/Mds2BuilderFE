'use strict'

angular

  .module("pvdm.assessments")

  .config( ($stateProvider, $urlRouterProvider, PATHS) ->

    $urlRouterProvider
      .when("", PATHS.START_PAGE)
      .when("/", PATHS.START_PAGE)

    $stateProvider
      .state('assessments',
        parent: 'layout:primary'
        url: '/assessment_form'
        templateUrl: 'assessment-form.html'
        controller: 'assessments.controller as assessmentsCtrl'
      )
  )