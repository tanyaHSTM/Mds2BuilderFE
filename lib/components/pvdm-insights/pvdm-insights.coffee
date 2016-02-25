'use strict'
angular

  .module('pvdm.components')

  .directive('pvdmInsights', ->
    restrict: 'E'
    replace: true
    templateUrl: 'pvdm-insights.html'
    scope:
      collection: '='
      filter: '='
      insights: '='
    controller: 'pvdmInsightsCtrl'
    controllerAs: 'insightsCtrl'
    bindToController: true
  )

  .controller( 'pvdmInsightsCtrl', ->
    vm = @
    vm.set = (param, value, label) ->
      vm.filter.set(param, value, label)
    vm.reset = ->
      insight.active = false for insight in vm.insights
      vm.filter.reset()
    return
  )

