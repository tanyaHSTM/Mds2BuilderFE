'use strict'

angular

  .module('pvdm.components')

  .component('pvdmStage',
    transclude: true
    controller: 'pvdmStageCtrl'
    templateUrl: 'pvdm-stage.html'
    bindings:
      active: '<'
  )

  .controller( 'pvdmStageCtrl', ->
    vm = @
    vm.active ||= true
    vm.toggle = ->
      vm.active = !vm.active
    return
  )
