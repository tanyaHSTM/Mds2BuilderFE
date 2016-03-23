'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmToggleSwitch',
    templateUrl: 'pvdm-toggle-switch.html'
    controller: 'toggleSwitchCtrl'
    controllerAs: 'switch'
    bindings:
      model: '=?'
      change: '&?'
      selected: '<?'
      disabled: '<?'
      trueLabel: '@?'
      falseLabel: '@?'
  )

  .controller('toggleSwitchCtrl', ->
    vm = @
    vm.trueLabel ||= 'app.on'
    vm.falseLabel ||= 'app.off'
    vm.toggle = ->
      return if @disabled
      @model = !@model
      @change?()
      return
    Object.defineProperties(@,
      'checked':
        get: ->
          if @selected?
            @selected
          else
            @model
    )
    return
  )
