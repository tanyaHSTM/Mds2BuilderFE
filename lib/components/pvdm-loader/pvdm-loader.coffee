'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmLoader',
    templateUrl: 'pvdm-loader.html'
    bindings:
      loading: '<'
      message: '@'
  )