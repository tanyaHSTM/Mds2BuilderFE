'use strict'

angular

  .module( 'pvdm.components' )

  .directive('pvdmSortColumn', ->
    restrict: 'A'
    require: '^pvdmSortableTable'
    transclude: true
    templateUrl: 'pvdm-sort-column.html'
    scope:
      sortBy: '=pvdmSortColumn'
    link: (scope, elem, attrs, table) ->
      scope.collection = table.collection
      elem.bind('click', (e) ->
        scope.$apply( ->
          table.sort(scope.sortBy)
        )
      )
      return
  )
