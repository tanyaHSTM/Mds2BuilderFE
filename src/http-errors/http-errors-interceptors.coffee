'use strict'

angular

  .module( 'pvdm.httpErrors' )

  #
  # Http Error Code Reference:
  # https://docs.google.com/document/d/1_dfvb1jfJ91bPDJ6-i0yjFAm5JdEw3H7-_Gx5xs0gO8

  .factory( 'httpErrorInterceptor', ( $rootScope, $q ) ->
    responseError: (rejection) ->
      $rootScope.$emit( "httpError:#{rejection.status}", rejection )
      $q.reject(rejection)
  )
