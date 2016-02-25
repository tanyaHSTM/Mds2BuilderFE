"use strict"

# https://github.com/sebastianha/angular-bootstrap-checkbox/blob/master/angular-bootstrap-checkbox.js

angular

  .module( "pvdm.components" )

  .directive( "pvdmToggleSwitch", ->
    require: "ngModel"
    restrict: "E"
    replace: true
    templateUrl: "pvdm-toggle-switch.html"
    scope:
      name: "@"
      disabled: "="
      indeterminate: "@"
      change: "&"
      trueLabel: "@"
      falseLabel: "@"
    link: (scope, elem, attrs, modelCtrl) ->

      trueValue = attrs.ngTrueValue ? true
      falseValue = attrs.ngFalseValue ? false

      scope.trueLabel ||= "app.on"
      scope.falseLabel ||= "app.off"

      if scope.name isnt undefined
        elem.name = scope.name

      scope.$watch( ->
        if modelCtrl.$modelValue is trueValue or modelCtrl.$modelValue is true or modelCtrl.$modelValue is 1
          modelCtrl.$setViewValue(trueValue)
        else
          modelCtrl.$setViewValue(falseValue)
        modelCtrl.$modelValue
      , (newVal, oldVal) ->
        scope.checked = modelCtrl.$modelValue is trueValue
      , true)

      scope.$watch( ->
        scope.disabled
      , (newVal, oldVal) ->
        if newVal
          elem.addClass("disabled")
        else
          elem.removeClass("disabled")
      , true)

      elem.bind("click", ->
        return if scope.disabled
        scope.$apply( ->
          if modelCtrl.$modelValue is falseValue
            modelCtrl.$setViewValue(trueValue)
            scope.change?()
          else
            modelCtrl.$setViewValue(falseValue)
            scope.change?()
          scope.indeterminate = false
        )
      )
  )
