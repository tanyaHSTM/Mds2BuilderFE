'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmTrowser',
    templateUrl: 'pvdm-trowser.html'
    controller: 'pvdmTrowserCtrl'
    controllerAs: 'trowser'
    bindings:
      header: '@'
      close: '@'
    transclude:
      body: 'trowserBody'
      stage: '?trowserStage'
      primary: '?trowserPrimaryActions'
      secondary: '?trowserSecondaryActions'
  )

  .controller( 'pvdmTrowserCtrl', () ->
    vm = @
    return
  )
