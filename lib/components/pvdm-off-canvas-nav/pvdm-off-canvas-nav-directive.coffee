'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmOffCanvasNav', ($document, offCanvasNav) ->
    restrict: 'E'
    replace: true
    controller: 'pvdmOffCanvasNavController'
    controllerAs: 'sidebar'
    bindToController: true
    templateUrl: 'pvdm-off-canvas-nav.html'
    link: (scope, elem, attr, ctrl) ->

      # clicks inside ocn do nothing
      elem.bind( 'click', ($event) ->
        if $event.stopPropagation then $event.stopPropagation()
        return
      )

      # clicks outside ocn collapse it
      $document.bind( 'click', ($event) ->
        scope.$apply( ->
          offCanvasNav.deactivate()
        )
        return
      )

      return
  )
