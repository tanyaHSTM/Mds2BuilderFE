'use strict'

angular

  .module( 'pvdm.components' )

  .component('pvdmLinearFlowNav',
    templateUrl: 'pvdm-linear-flow-nav.html'
    bindings:
      steps: '<'
      currentStep: '<'
  )
