'use strict'

angular

  .module('pvdm.components')

  .directive( 'pvdmModal', ->
    templateUrl: 'pvdm-modal.html'
    transclude:
      'body': 'modalBody'
      'primary': '?modalPrimaryActions'
      'secondary': '?modalSecondaryActions'
  )