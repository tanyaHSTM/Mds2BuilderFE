'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmOffCanvasNav', ($document, offCanvasNav) ->
    restrict: 'E'
    replace: true
    controller: 'pvdmOffCanvasNavController'
    controllerAs: 'ocn'
    bindToController: true
    templateUrl: 'pvdm-off-canvas-nav.html'
    transclude:
      main: 'ocnMain'
      footer: 'ocnFooter'
    link: (scope, elem, attr, ctrl) ->

      #
      # Prevent clicks from bubbling to document layer
      elem.bind( 'click', ($event) ->
        if $event.stopPropagation then $event.stopPropagation()
        return
      )

      #
      # Clicks outside ocn collapse it
      $document.bind( 'click', ($event) ->
        scope.$apply( ->
          offCanvasNav.deactivate()
        )
        return
      )

      return
  )

  .controller( 'pvdmOffCanvasNavController', (offCanvasNav) ->
    vm = @
    vm.svc = offCanvasNav
    vm.year = new Date().getFullYear()
    return
  )

  .service( 'offCanvasNav', ($rootScope) ->
    active: false
    setState: (state) ->
      $rootScope.$emit( 'ocn:toggle', @active = state)
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

  .run( ($rootScope, offCanvasNav, mask) ->

    #
    # Toggle mask with OCN
    $rootScope.$on( 'ocn:toggle', (event, active) ->
      if active then mask.activate(true) else mask.deactivate()
    )

    #
    # Hide OCN on logout/auto-logout
    $rootScope.$on( 'user:logout', (event) ->
      offCanvasNav.deactivate()
    )

  )