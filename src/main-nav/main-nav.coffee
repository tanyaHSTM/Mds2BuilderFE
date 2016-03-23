'use strict'

angular

  .module( 'pvdm.mainNav', [
    'ui.router',
    'pvdm.session'
  ])

  .directive( 'mainNav', ->
    templateUrl: 'main-nav.html'
    controller: 'pvdmMainNavController'
    controllerAs: 'nav'
    bindToController: true
  )

  .controller( 'pvdmMainNavController', ($state, offCanvasNav, ACCESS) ->

    vm = @
    vm.service = offCanvasNav

    vm.close = ->
      offCanvasNav.deactivate()

    return
  )
