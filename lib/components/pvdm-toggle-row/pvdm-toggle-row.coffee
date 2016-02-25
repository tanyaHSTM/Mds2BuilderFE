'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmToggleRow', ($location) ->
    scope:
      value: '=pvdmToggleRow'
    link: (scope, element, attrs) ->
      element.addClass('pvdm-toggle-row')
      element.bind('click', (event) ->
        if ! (/BUTTON|INPUT|A/).test(event.target.nodeName)
          scope.$apply( ->
            scope.value = !scope.value
          )
      )

  )
