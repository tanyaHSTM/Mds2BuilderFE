'use strict'

angular

  .module( 'pvdm.messages' )

  .service( 'messages', ($log, locker, $q, MESSAGES_TPL) ->
    #
    # Messages object
    #
    # {
    #   currentRoute: {
    #     'danger': ['a message', 'another message'],
    #     'warning': ['some text']
    #   },
    #   nextRoute: {
    #     'success': ['it worked!']
    #   },
    #   persistent: {
    #     'info': ['tomorrow we are down for maintenance']
    #   }
    # }
    #
    # Message cache
    @data = locker.get('messages', MESSAGES_TPL)
    #
    # Add message to cache
    @add = (messages, type, route) ->
      if !(/success|info|warning|danger/).test(type)
        $log.debug("#{type} is not valid message type (success/info/warning/danger)")
        return
      if !messages
        $log.debug('messages missing "messages"')
        return
      if !route
        $log.debug('messages missing "route"')
        return
      # overwrite currentRoute messages to prevent history from stacking up
      if route is 'currentRoute' then @clear()
      # ensure type array is defined
      @data[route][type] ||= []
      # convert messages string to array
      angular.isArray(messages) || (messages = [messages])
      # add messages to object
      for message in messages
        if !_.includes(@data[route][type], message)
          @data[route][type].push(message)
          locker.put('messages', @data)
        return
    #
    # Transfer nextRoute to currentRoute for display
    @transferRoute = ->
      if !_.isEmpty(@data.nextRoute)
        angular.copy(@data.nextRoute, @data.currentRoute)
        @clear('nextRoute')
        locker.put('messages', @data)
    #
    # Add message for next route -> success message for example
    @forNextRoute = (messages, type='success') ->
      @add(messages, type, 'nextRoute')
    #
    # Add message for current route -> danger message for example
    @forCurrentRoute = (messages, type='danger') ->
      @add(messages, type, 'currentRoute')
    #
    # Add site wide persistent message
    @forPersistent = (messages, type='warning', global=false) ->
      @add(messages, type, 'persistent')
    #
    # Clear all messages for given route (currentRoute/nextRoute/persistent)
    @clear = (route='currentRoute') ->
      that = @
      angular.copy({}, that.data[route])
      locker.put('messages', @data)
    #
    # Clear messages by type (success/info/warning/danger)
    @clearByType = (type, route='currentRoute') ->
      delete @data[route][type]
      locker.put('messages', @data)
    #
    # Reset all messages
    @reset = ->
      angular.copy(MESSAGES_TPL, @data)
      locker.put('messages', MESSAGES_TPL)

    return
  )
