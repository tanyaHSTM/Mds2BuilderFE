'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmLinkRow', ($location) ->
    scope:
      disableLink: '='
    link: (scope, element, attrs) ->
      if scope.disableLink
        element.addClass('ignore-hover')
      else
        element.addClass('pvdm-link-row')
      element.bind('click', (event) ->
        if !(/BUTTON|INPUT|A/).test(event.target.nodeName) and !scope.disableLink
          $location.url(attrs.pvdmLinkRow)
      )
  )
