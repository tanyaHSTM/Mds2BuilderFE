'use strict'

angular

.module('pvdm.components')

  .component('pvdmFieldLevelHelp',
    templateUrl: 'pvdm-field-level-help.html'
    controller: 'pvdmFieldLevelHelpCtrl'
    bindings:
      heading: '@'
      message: '@'
  )

  .controller('pvdmFieldLevelHelpCtrl', ->
    @show = true

    @close = () =>
      @show = false
    return
  )