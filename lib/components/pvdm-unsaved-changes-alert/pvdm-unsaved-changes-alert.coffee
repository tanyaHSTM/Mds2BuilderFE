###

  Add this directive to a form and a modal alert will display if they're are
  unsaved changes in the form and the user attempts to navigate away from the
  page.

  Note: The alert will only display on route changes. If the form's visibility
  is being toggled or removed from the DOM, the alert will NOT display.

  Implementation:
  <form pvdm-unsaved-changes-alert> ... </form>

###

"use strict"

angular

  .module( "pvdm.unsavedChangesAlert", [
    'ui.router',
    'ui.bootstrap'
  ])

  .directive( "pvdmUnsavedChangesAlert", ($rootScope, $uibModal) ->
    require: "form"
    link: (scope, element, attr, form) ->
      $rootScope.$on("$stateChangeStart", (evt, toState, toParams, fromState, fromParams) ->
        if form.$dirty and !form.$submitted
          evt.preventDefault()
          $uibModal.open(
            templateUrl: "pvdm-unsaved-changes-alert.html"
            controller: "unsavedChangesAlertController as $ctrl"
            windowClass: "modal-danger"
            resolve:
              form: ->
                form
              state: ->
                name: toState.name
                params: toParams
          )
      )
  )

  .controller( "unsavedChangesAlertController", ($uibModalInstance, $state, form, state) ->
    @continue = ->
      $uibModalInstance.close()
      form.$setPristine()
      $state.go(state.name, state.params)
    @cancel = ->
      $uibModalInstance.dismiss()
    return
  )