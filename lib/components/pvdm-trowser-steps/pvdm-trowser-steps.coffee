'use strict'

angular

  .module( 'pvdm.components' )

  .component('pvdmTrowserSteps',
    templateUrl: 'pvdm-trowser-steps.html'
    bindings:
      steps: '<'
      currentStep: '<'
  )
