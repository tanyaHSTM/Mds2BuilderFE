'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmDrawer', ->
    templateUrl: 'pvdm-drawer.html'
    transclude:
      header: 'drawerHeader'
      body: 'drawerBody'
      primary: '?drawerPrimaryActions'
      secondary: '?drawerSecondaryActions'
  )

  .run( ($rootScope, $uibModalStack) ->
    $rootScope.$on( '$stateChangeSuccess', (evt, toState, toParams, fromState, fromParams) ->
      $uibModalStack.dismissAll('auto_logout')
    )
  )