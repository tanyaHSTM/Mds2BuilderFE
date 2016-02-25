'use strict'

angular

  .module( 'pvdm.messages' )

  .controller( 'pvdmMessagesController', (messages) ->
    #
    # Alert types
    @types =
      'success': 'circle-ok'
      'danger': 'circle-remove'
      'warning': 'circle-exclamation-mark'
      'info': 'circle-info'
    #
    # Expose messages service to view
    @messages = messages

    return
  )
