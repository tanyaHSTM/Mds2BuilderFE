'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmNavIcon',
    controller: 'pvdmNavIconCtrl'
    templateUrl: 'pvdm-nav-icon.html'
  )

  .controller( 'pvdmNavIconCtrl', (offCanvasNav) ->
    @ocnav = offCanvasNav
    @toggle = (event) ->
      offCanvasNav.toggle()
      event.stopPropagation()
    return
  )
