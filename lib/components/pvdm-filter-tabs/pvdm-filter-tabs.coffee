'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmFilterTabs',
    templateUrl: 'pvdm-filter-tabs.html'
    controller: 'pvdmFilterTabsCtrl'
    bindings:
      filterManager: '='
  )

  .controller( 'pvdmFilterTabsCtrl', ->
    vm = @
    vm.clear = (param) ->
      vm.filterManager.clear(param)
    return
  )
