'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmDownloadIcon',
    templateUrl: 'pvdm-download-icon.html'
    bindings:
      downloadLinks: '<'
  )