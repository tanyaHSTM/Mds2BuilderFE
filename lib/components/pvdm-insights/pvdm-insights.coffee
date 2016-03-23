'use strict'
angular

  .module('pvdm.components')

  .component('pvdmInsights',
    templateUrl: 'pvdm-insights.html'
    controller: 'pvdmInsightsCtrl'
    controllerAs: 'insightsCtrl'
    bindings:
      collection: '<'
      filter: '<'
      insights: '<'
  )

  .controller( 'pvdmInsightsCtrl', ->
    @set = (param, value, label) =>
      @insights.forEach( (insight) ->
        insight.active = false
      )
      @filter.setExclusive(param, value, label) unless !param
    return
  )

