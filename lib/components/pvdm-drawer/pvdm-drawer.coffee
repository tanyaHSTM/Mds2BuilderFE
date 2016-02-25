'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmDrawer', ->
    templateUrl: 'pvdm-drawer.html'
    transclude:
      header: 'drawerHeader'
      body: 'drawerBody'
      footer: 'drawerFooter'
  )