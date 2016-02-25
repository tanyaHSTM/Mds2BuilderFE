'use strict'

angular

.module( 'pvdm.highcharts', [])

.directive( 'chart', ->
    restrict: 'AE'
    template: '<div></div>'
    scope:
      chartData: '=value'
      chartObj: '=?'
    transclude: true
    replace: true
    link: ($scope, $element, $attrs) ->

      # Update when charts data changes
      $scope.$watch( 'chartData', (value) ->

        return unless value

        # use default values if nothing is specified in the given settings
        $scope.chartData.chart.renderTo ||= $element[0]

        if $attrs.type
          $scope.chartData.chart.type ||= $attrs.type

        if $attrs.height
          $scope.chartData.chart.height ||= $attrs.height

        if $attrs.width
          $scope.chartData.chart.width ||= $attrs.width

        $scope.chartObj = new Highcharts.Chart($scope.chartData)

      )

)