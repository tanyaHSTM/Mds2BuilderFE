'use strict'

angular

  .module('pvdm.previousUrl')

  .service('previousUrl', (locker, $location) ->

    get: ->
      locker.get('previous-url')

    set: (url) ->
      url ||= window.location.hash.replace('#','')
      if url isnt locker.get('current-url')
        locker.put('previous-url', locker.get('current-url') || url )
        locker.put('current-url', url)

    go: ->
      $location.url( @get() )
  )
