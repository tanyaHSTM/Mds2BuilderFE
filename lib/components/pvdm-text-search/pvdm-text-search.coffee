'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmTextSearch',
    templateUrl: 'pvdm-text-search.html'
    controller: 'pvdmTextSearchCtrl'
    bindings:
      model: '='
      label: '@'
  )

  .controller( 'pvdmTextSearchCtrl', ->
    vm = @
    vm.clear = ->
      vm.model = ''
    return
  )
