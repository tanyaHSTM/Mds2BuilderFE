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

  .run( ($rootScope, mask) ->
    #
    # Hide mask on logout/auto-logout
    $rootScope.$on( 'user:logout', (event) ->
      mask.deactivate()
    )
  )