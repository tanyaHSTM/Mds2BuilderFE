'use strict'

angular

  .module('pvdm.components')

  .component('pvdmSchemaForm',
    transclude: true
    templateUrl: 'pvdm-schema-form.html'
    bindings:
      schema: '@'
      form: '@'
      model: '@'
  )
