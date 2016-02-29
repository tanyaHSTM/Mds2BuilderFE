'use strict'

angular

  .module("pvdm.assessments")

  .config( ($stateProvider) ->

    $stateProvider
      .state('assessments',
        parent: 'layout:primary'
        url: '/assessment_form'
        templateUrl: 'assessment-form.html'
        controller: 'assessments.controller as assessmentsCtrl'
      )
  )