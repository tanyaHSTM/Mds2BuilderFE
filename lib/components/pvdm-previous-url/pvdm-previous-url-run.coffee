'use strict'

angular

  .module('pvdm.previousUrl')

  .run( ($rootScope, previousUrl) ->
    $rootScope.$on('$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      previousUrl.set() unless fromState.data?.noCache
    )
  )