'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmInlineLoader',
    templateUrl: 'pvdm-inline-loader.html'
    bindings:
      loading: '<'
      message: '@'
  )