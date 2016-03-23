'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmLogo',
    templateUrl: 'pvdm-logo.html'
    controller: 'pvdmLogoController'
    controllerAs: 'logo'
  )

  .controller( 'pvdmLogoController', (offCanvasNav) ->
    @toggle = (event) ->
      event.stopPropagation()
      offCanvasNav.toggle()
    return

  )
