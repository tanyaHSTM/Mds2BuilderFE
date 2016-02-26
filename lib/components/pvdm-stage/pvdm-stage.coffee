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
    @active ||= true
    @toggle = =>
      @active = !@active
    return
  )
