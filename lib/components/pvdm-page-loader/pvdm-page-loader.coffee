'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmPageLoader',
    templateUrl: 'pvdm-page-loader.html'
    controller: 'pvdmPageLoaderController'
    controllerAs: 'pageLoader'
  )

  .controller( 'pvdmPageLoaderController', (pageLoader) ->

    @svc = pageLoader

    Object.defineProperties(@,
      'show':
        get: ->
          pageLoader.active
    )

    return
  )

  .service( 'pageLoader', ->
    @active = false
    @hideHeader = false
    Object.defineProperties(@,
      'activate':
        value: (@message='app.loading', options) ->
          angular.extend(@, options)
          @active = true
      'deactivate':
        value: ->
          @active = false
          @hideHeader = false
    )
    return
  )
