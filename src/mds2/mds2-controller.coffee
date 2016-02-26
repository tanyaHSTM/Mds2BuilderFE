"use strict"

angular

  .module( "pvdm.mds2" )

  .controller( "mds2.controller", ( $translate, $http, deviceDetector, messages ) ->

    vm = @

    $translate("mds2.get_started").then( (message) ->
      messages.forCurrentRoute(message, "info")
    )

    return
  )
