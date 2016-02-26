'use strict'

angular

  .module( 'pvdm.components' )

  .service( 'offCanvasNav', ($rootScope) ->
    active: false
    setState: (state) ->
      $rootScope.$emit( 'pvdm-toggle-ocn', @active = state)
    activate: ->
      @setState(true)
    deactivate: ->
      @setState(false)
    toggle: ->
      if @active
        @deactivate()
      else
        @activate()
  )
