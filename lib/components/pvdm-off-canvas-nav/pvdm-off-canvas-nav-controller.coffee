'use strict'

angular

  .module( 'pvdm.components' )

  .controller( 'pvdmOffCanvasNavController', ($rootScope, $scope, $filter, $state, DqiSchema, ASSESSMENT_TYPE, offCanvasNav) ->

    vm = @

    vm.model = DqiSchema.model
    vm.navService = offCanvasNav

    vm.setAdmission = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.ADMISSION)
      vm.closeNav()

    vm.setQuarterly = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.QUARTERLY)
      vm.closeNav()

     vm.setAnnual = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.ANNUAL)
      vm.closeNav()

    vm.setDischarge = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.DISCHARGE)
      vm.closeNav()

    vm.year = new Date().getFullYear()

    vm.closeNav = ->
      offCanvasNav.deactivate()

    return
  )
