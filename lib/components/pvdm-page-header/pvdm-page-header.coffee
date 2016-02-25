'use strict'

angular

  .module('pvdm.components')

  .component('pvdmPageHeader',
    transclude: true
    templateUrl: 'pvdm-page-header.html'
    bindings:
      header: '@'
      backLabel: '@'
      backUrl: '@'
      subHeader: '@'
  )
