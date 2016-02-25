'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmProgressIcon',
    templateUrl: 'pvdm-progress-icon.html'
    controller: 'pvdmProgressIconCtrl'
    bindings:
      complete: '@'
      label: '@'
  )

  .controller( 'pvdmProgressIconCtrl', ->
    vm = @
    switch vm.complete
      when 'Yes'
        vm.icon = 'circle-ok'
        vm.tooltip = 'app.complete'
        vm.cls = 'text-success'
      when 'No'
        vm.icon = 'adjust'
        vm.tooltip = 'app.incomplete'
        vm.cls = 'text-warning'
      else
        vm.icon = 'circle-minus'
        vm.tooltip = 'app.not_started'
        vm.cls = 'text-danger'
    return
  )