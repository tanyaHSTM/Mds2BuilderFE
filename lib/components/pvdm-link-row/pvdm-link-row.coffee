'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmLinkRow', ($location) ->
    scope:
      url: '@'
    link: (scope, element, attrs) ->
      element.addClass('pvdm-link-row')
      element.bind('click', (event) ->
        if ! (/BUTTON|INPUT|A/).test(event.target.nodeName)
          $location.url(attrs.pvdmLinkRow)
      )
  )
