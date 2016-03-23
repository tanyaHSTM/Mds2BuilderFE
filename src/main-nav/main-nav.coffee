'use strict'

angular

  .module( 'pvdm.mainNav', [
    'ui.router',
  ])

  .directive( 'mainNav', ->
    templateUrl: 'main-nav.html'
    controller: 'pvdmMainNavController'
    controllerAs: 'nav'
    bindToController: true
  )

  .controller( 'pvdmMainNavController', ($state, $filter, offCanvasNav, DqiSchema, ASSESSMENT_TYPE) ->

    vm = @
    vm.model = DqiSchema.model
    vm.service = offCanvasNav

    vm.setAdmission = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.ADMISSION)
      vm.close()

    vm.setQuarterly = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.QUARTERLY)
      vm.close()

     vm.setAnnual = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.ANNUAL)
      vm.close()

    vm.setDischarge = ->
      $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.DISCHARGE)
      vm.close()

    vm.close = ->
      offCanvasNav.deactivate()

    return
  )
