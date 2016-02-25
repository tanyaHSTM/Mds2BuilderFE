'use strict'

angular

  .module('pvdm.components')

  .component('pvdmRecordDetail',
    templateUrl: 'pvdm-record-detail.html'
    bindings:
      label: '@'
      value: '@'
  )
