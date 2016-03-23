'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmSortableTable', ->
    restrict: 'A'
    controller: 'pvdmSortableTableCtrl'
    scope:
      collection: '='
    link: (scope, elem, attrs, table) ->
      elem.addClass('pvdm-sortable-table')
      return
  )

  .controller( 'pvdmSortableTableCtrl', ($scope) ->
    Object.defineProperties(@,
      collection:
        get: ->
          $scope.collection
      sort:
        value: (sortKey) ->
          if sortKey is $scope.collection.sortKey
            $scope.collection.reverseSort()
          else
            $scope.collection.sortBy(sortKey)
    )
    return
  )

  .directive( 'sortBy', ->
    restrict: 'A'
    require: '^^pvdmSortableTable'
    transclude: true
    templateUrl: 'pvdm-sort-column.html'
    scope:
      sortBy: '='
    link: (scope, elem, attrs, table) ->
      elem.addClass('sort-column-header')
      scope.$watch( ->
        table.collection
      ,(newValue, oldValue) ->
        scope.collection = table.collection unless !newValue?
      )
      elem.bind('click', (e) ->
        scope.$apply( ->
          table.sort(scope.sortBy)
        )
      )
      return
  )
