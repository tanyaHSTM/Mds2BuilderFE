'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmLogo',
    controller: 'pvdmLogoController'
    templateUrl: 'pvdm-logo.html'
  )

  .controller( 'pvdmLogoController', (offCanvasNav) ->
    @toggle = (event) ->
      event.stopPropagation()
      offCanvasNav.toggle()
    return

  )
