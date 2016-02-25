'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmMask',
    templateUrl: 'pvdm-mask.html'
    controller: 'pvdmMaskCtrl'
  )

  .controller( 'pvdmMaskCtrl', ($rootScope, mask) ->
    vm = @
    vm.svc = mask
    vm.close = ($event) ->
      if !vm.svc.closeOnClick
        if $event.stopPropagation then $event.stopPropagation()
        if $event.preventDefault then $event.preventDefault()
      else
        mask.deactivate()
    $rootScope.$on( 'pvdm-toggle-ocn', (event, active) ->
      if active
        mask.activate(true)
      else
        mask.deactivate()
    )
    $rootScope.$on( 'pvdm-logout-success', (event) ->
      mask.deactivate()
    )
    return
  )

  .service( 'mask', ->
    @active = false
    @set = (active) ->
      @active = active
    @activate = (closeOnClick=true) ->
      @closeOnClick = closeOnClick
      @set(true)
    @deactivate = ->
      @set(false)
    return
  )
