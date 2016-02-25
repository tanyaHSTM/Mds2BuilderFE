'use strict'

angular

  .module('pvdm.components')

  .directive('pvdmInsight', ($timeout) ->
    restrict: 'E'
    replace: true
    require: '^pvdmInsights'
    templateUrl: 'pvdm-insight.html'
    scope:
      type: '@'
      active: '='
      param: '@'
      count: '='
      label: '@'
      tip: '@'
    link: (scope, elem, attrs, insights) ->
      scope.filter = insights.filter
      elem.bind('click', (e) ->
        scope.$apply( ->
          insights.reset()
          if !!scope.param
            insights.set(scope.param, true, scope.label)
        )
      )
      return
  )
