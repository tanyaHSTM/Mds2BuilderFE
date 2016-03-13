'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmTextLogo',
    controller: 'pvdmTextLogoController'
    templateUrl: 'pvdm-text-logo.html'
  )

  .controller( 'pvdmTextLogoController', (offCanvasNav) ->
    @toggle = (event) ->
      event.stopPropagation()
      offCanvasNav.toggle()
    return

  )
