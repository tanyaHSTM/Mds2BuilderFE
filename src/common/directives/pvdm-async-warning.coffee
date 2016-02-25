"use strict"

angular

.module("pvdm.directives")

.directive("pvdmAsyncWarning", ($log, $http) ->

  require: 'ngModel'
  restrict: 'A'
  scope:
    identifierDuplicate: '='

  link: (scope, elem, attrs, ngModel) ->
    type = attrs.pvdmAsyncWarning
    firstRun = true
    originalValue = null

    scope.$watch( ->
      ngModel.$modelValue
    , (currentValue, previousValue) ->

      if firstRun
        firstRun = false
        originalValue = currentValue

      if currentValue
        if ! (currentValue in [previousValue, originalValue])
          params = {}
          params[ngModel.$name] = currentValue
          angular.extend(params, JSON.parse(attrs.params)) if attrs.params
          $http
          .post( "/api/validation/#{type}", params )
          .success( (data, status, headers, config) ->
            ngModel.$setValidity(type, true)
            scope.identifierDuplicate = false
          ).error( (data, status, headers, config) ->
            ngModel.$setValidity(type, true)
            scope.identifierDuplicate = true
          )
        else
          ngModel.$setValidity(type, true)
      else
        ngModel.$setValidity(type, true)
    )

)