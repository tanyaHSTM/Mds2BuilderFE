"use strict"

angular

  .module( "pvdm" )

  .run( ($http, $rootScope, $document, $translate, MDS2) ->

    #
    # Set window/tab title
    $rootScope.$on( "$stateChangeSuccess", (evt, toState, toParams, fromState, fromParams) ->
      if toState.data?.pageTitle?
        $translate(toState.data.pageTitle).then( (title) ->
          $document[0].title = title
        )
      else
        $document[0].title = MDS2.NAME
    )

  )
