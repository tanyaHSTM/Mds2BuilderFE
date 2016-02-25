'use strict'

angular

  .module( 'pvdm.httpErrors' )

  .config( ($stateProvider, $httpProvider) ->

    #
    # Http Error Code Reference:
    # https://docs.google.com/document/d/1_dfvb1jfJ91bPDJ6-i0yjFAm5JdEw3H7-_Gx5xs0gO8

    $httpProvider.interceptors.push('httpErrorInterceptor')

    $stateProvider

      # 401 Error
      # Destroys session and redirects to login

      # 403 Error
      .state('403Error',
        parent: 'layout:primary'
        url: '/403_error'
        templateUrl: '403.html'
        data:
          pageTitle: 'http_errors.error_403.page_title'
          noCache: true
      )

      # 404 Error
      .state('404Error',
        parent: 'layout:primary'
        url: '/404_error'
        templateUrl: '404.html'
        data:
          pageTitle: 'http_errors.error_404.page_title'
          noCache: true
      )

      # 410 Error
      .state('410Error',
        parent: 'layout:primary'
        url: '/410_error'
        templateUrl: '410.html'
        data:
          pageTitle: 'http_errors.error_410.page_title'
          noCache: true
      )

      # 500 Error
      .state( '500Error',
        parent: 'layout:primary'
        url: '/500_error'
        templateUrl: '500.html'
        data:
          pageTitle: 'http_errors.error_500.page_title'
          noCache: true
      )

  )