'use strict'

angular

  .module( 'pvdm.services' )

  .service( 'FilterParameters', ($rootScope, $translate) ->

    class FilterParameters

      constructor: (@params={}) ->

      set: (param, value, label) ->
        @params[param] = 
          label: $translate.instant(label)
          value: value
        $rootScope.$emit('filterParameters:set', angular.extend({name: param}, @params[param]) )

      setExclusive: (param, value, label) ->
        for key, val of @params
          @clear(key) unless key is param
        @set(param, value, label)

      clear: (param) ->
        @params[param] =
          label: ''
          value: ''
        $rootScope.$emit('filterParameters:clear', angular.extend({name: param}, @params[param]) )

      reset: ->
        for key, val of @params
          @clear(key)
        $rootScope.$emit('filterParameters:reset', @params)

  )

  .run( ($rootScope, $log) ->
    $rootScope.$on('filterParameters:set', (event, param) ->
      $log.debug "Filter parameter set: #{JSON.stringify param}"
    )
    $rootScope.$on('filterParameters:clear', (event, param) ->
      $log.debug "Filter parameter clear: #{JSON.stringify param}"
    )
    $rootScope.$on('filterParameters:reset', (event, params) ->
      $log.debug "Filter parameters reset: #{JSON.stringify params}"
    )
  )