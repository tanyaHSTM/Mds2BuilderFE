'use strict'

angular

  .module('pvdmSSN')

  .directive('ssnField', ($filter) ->
      ssn = $filter('ssn')
      ssnReverse = $filter('ssnReverse')
      restrict: 'A'
      require: 'ngModel'
      link: (scope, element, attrs, modelCtrl) ->
        formatter = (value) ->
          ssn(value)
        parser = (value) ->
          formatted = ssnReverse(value)
          element.val(ssn(formatted))
          formatted
        modelCtrl.$formatters.push(formatter)
        modelCtrl.$parsers.unshift(parser)
  )