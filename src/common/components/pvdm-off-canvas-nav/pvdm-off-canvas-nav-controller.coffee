'use strict'

angular

  .module( 'pvdm.components' )

  .controller( 'pvdmOffCanvasNavController', ($rootScope, $scope, $state, offCanvasNav) ->

    vm = @
    vm.navService = offCanvasNav
    vm.year = new Date().getFullYear()

    vm.closeNav = ->
      offCanvasNav.deactivate()

    return
  )
