'use strict'

angular

  .module( 'pvdm.directives' )

  .directive( 'pvdmIcon', [ ->
    restrict: 'AE'
    link: (scope, element, attrs) ->
      element
        .addClass("glyphicon-#{attrs.pvdmIcon} pvdm-icon")
  ])
