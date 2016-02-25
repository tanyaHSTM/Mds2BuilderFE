'use strict'

angular

  .module( 'pvdm.components' )

  .directive('pvdmSortableTable', ->
    restrict: 'A'
    controller: 'pvdmSortableTableCtrl'
    scope:
      collection: '='
  )

  .controller( 'pvdmSortableTableCtrl', ($scope) ->
    @collection = $scope.collection
    @sort = (sort) ->
      $scope.collection.sortBy( sort )
    return
  )
