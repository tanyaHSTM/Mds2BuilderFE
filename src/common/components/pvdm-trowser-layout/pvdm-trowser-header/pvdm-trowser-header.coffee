'use strict'

angular

  .module('pvdm.components')

  .component('pvdmTrowserHeader',
    templateUrl: 'pvdm-trowser-header.html'
    controller: 'pvdmTrowserHeaderCtrl'
    bindings:
      header: '@'
      close: '@'
  )

  .controller( 'pvdmTrowserHeaderCtrl', ($location) ->
    vm = @
    vm.closeTrowser = ->
      $location.url( vm.close.replace('#','') )
    return
  )
