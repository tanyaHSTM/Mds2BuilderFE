'use strict'

angular

  .module( 'pvdm.components' )

  .component('pvdmSpinner',
    templateUrl: 'pvdm-spinner.html'
    controller: 'pvdmSpinnerCtrl'
    bindings:
      message: '@?'
  )

  .controller( 'pvdmSpinnerCtrl', (spinner) ->
    @svc = spinner
    @blockClick = ($event) ->
      if $event.stopPropagation then $event.stopPropagation()
      if $event.preventDefault then $event.preventDefault()
    return
  )

  .service( 'spinner', ->
    @active = false
    @set = (active, message) ->
      @active = active
      @message = message || 'app.processing'
    @activate = (message) ->
      @set(true, message)
    @deactivate = ->
      @set(false)
    return
  )
