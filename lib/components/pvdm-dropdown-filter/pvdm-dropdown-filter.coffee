'use strict'

angular

  .module( 'pvdm.components' )

  .component( 'pvdmDropdownFilter',
    transclude: true
    templateUrl: 'pvdm-dropdown-filter.html'
    controller: 'dropdownFilterCtrl'
    controllerAs: 'dropdown'
    bindings:
      params: '='
  )

  .controller( 'dropdownFilterCtrl', ($scope, dropdownFilter, $element, $document) ->
    #
    # Clicks outside dropdown close it
    $document.bind('click', ($event) ->
      $scope.$apply( ->
        dropdownFilter.deactivate()
      )
    )
    #
    # Clicks inside dropdown do NOT close it
    $element.bind('click', ($event) ->
      if $event.stopPropagation then $event.stopPropagation()
    )
    @svc = dropdownFilter
    @clearFilter = =>
      dropdownFilter.deactivate()
      @params.reset()
    @toggle = ($event) ->
      if $event.stopPropagation then $event.stopPropagation()
      dropdownFilter.toggle()
    return
  )

  .service( 'dropdownFilter', ->
    active: false
    setState: (state) ->
      @active = state
    activate: ->
      @setState(true)
    deactivate: ->
      @setState(false)
    toggle: ->
      @active = !@active
  )

  .run( ($rootScope, dropdownFilter) ->
    #
    # Automatically close dropdown on route change
    $rootScope.$on( '$stateChangeStart', (evt, toState, toParams, fromState, fromParams) ->
      dropdownFilter.deactivate()
    )
  )