'use strict'

angular

  .module( 'pvdm.httpErrors' )

  .run( ($rootScope, $state, $log, $translate, messages) ->

    #
    # Http Error Code Reference:
    # https://docs.google.com/document/d/1_dfvb1jfJ91bPDJ6-i0yjFAm5JdEw3H7-_Gx5xs0gO8

    #
    # 401 Unuathorized
    $rootScope.$on( 'httpError:401', (event, data) ->
      $log.error "Unauthorized: #{JSON.stringify data}"
      AuthService
        .logout()
        .then( ->
          $translate('http_errors.error_401.message').then( (message) ->
            messages.forNextRoute(message, 'danger')
          )
          $state.go('login')
        )
    )

    #
    # 403 Forbidden
    $rootScope.$on( 'httpError:403', (event, data) ->
      $log.error "Forbidden: #{JSON.stringify data}"
      $state.go('403Error')
    )

    #
    # 404 Not Found
    $rootScope.$on( 'httpError:404', (event, data) ->
      $log.error "Not Found: #{JSON.stringify data}"
      $state.go('404Error')
    )

    #
    # 410 Gone
    $rootScope.$on( 'httpError:410', (event, data) ->
      $log.error "Gone: #{JSON.stringify data}"
      $state.go('410Error')
    )

    #
    # 500 Internal Server Error
    $rootScope.$on( 'httpError:500', (event, data) ->
      $log.error "Internal Server Error: #{JSON.stringify data}"
      $state.go('500Error')
    )

  )
