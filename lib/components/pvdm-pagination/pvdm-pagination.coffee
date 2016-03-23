'use strict'

angular

  .module('pvdm.components')

  .component( 'pvdmPagination',
    templateUrl: 'pvdm-pagination.html'
    controller: 'pvdmPaginationCtrl'
    controllerAs: 'pp'
    transclude: true
    bindings:
      label: '@'
      count: '<'
  )

  .controller( 'pvdmPaginationCtrl', (MDS2) ->
    vm = @
    vm.MDS2 = MDS2
    return
  )
