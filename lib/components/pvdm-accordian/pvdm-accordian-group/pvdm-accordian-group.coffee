'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmAccordianGroup',
    templateUrl: 'pvdm-accordian-group.html'
    controller: 'pvdmAccordianGroupController'
    controllerAs: 'group'
    transclude: true
    bindings:
      classes: '@'
      icon: '@'
      label: '@'
  )

  .controller( 'pvdmAccordianGroupController', ->
    return
  )