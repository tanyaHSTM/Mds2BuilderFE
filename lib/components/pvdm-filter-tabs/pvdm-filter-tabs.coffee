'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmFilterTabs',
    templateUrl: 'pvdm-filter-tabs.html'
    controller: 'pvdmFilterTabsCtrl'
    bindings:
      filterManager: '<'
  )

  .controller( 'pvdmFilterTabsCtrl', ->
    @clear = (param) =>
      @filterManager.clear(param)
    return
  )
