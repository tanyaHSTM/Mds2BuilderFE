'use strict'

angular

  .module( 'pvdm.messages' )

  .run( ( $rootScope, $location, $translate, messages ) ->
    #
    # Cycle route messages
    $rootScope.$on( '$stateChangeSuccess', (evt, toState, toParams, fromState, fromParams) ->
      messages.clear()
      messages.transferRoute()
    )
  )
