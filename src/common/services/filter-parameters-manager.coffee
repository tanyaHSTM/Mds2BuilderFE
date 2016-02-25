"use strict"

angular

  .module( "pvdm.services" )

  .service( "FilterParametersManager", (dropdownFilter, $translate) ->

    class FilterParametersManager

      constructor: (@params={}) ->

      set: (param, value, label) ->
        @params[param] = 
          label: $translate.instant(label)
          value: value

      clear: (param) ->
        @params[param] =
          label: ""
          value: ""

      reset: ->
        dropdownFilter.deactivate() unless !dropdownFilter.active # doesn't belong here...
        for key, value of @params
          @clear(key)

  )