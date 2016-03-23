'use strict'

angular

  .module('pvdm.components')

  .component('pvdmGuidance',
    templateUrl: 'pvdm-guidance.html'
    controller: 'pvdmGuidanceCtrl'
    bindings:
      title: '@'
      message: '@'
  )

  .controller('pvdmGuidanceCtrl', ->
    @show = true

    @close = () =>
      @show = false
    return
  )