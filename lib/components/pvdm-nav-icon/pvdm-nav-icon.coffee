'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmNavIcon',
    templateUrl: 'pvdm-nav-icon.html'
    controller: 'pvdmNavIconCtrl'
    controllerAs: 'navIcon'
  )

  .controller( 'pvdmNavIconCtrl', (offCanvasNav) ->
    @ocnav = offCanvasNav
    @toggle = (event) ->
      offCanvasNav.toggle()
      event.stopPropagation()
    return
  )
