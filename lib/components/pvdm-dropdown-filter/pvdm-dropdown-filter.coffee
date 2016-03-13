'use strict'

angular

  .module( 'pvdm.components' )

  .directive( 'pvdmDropdownFilter', (dropdownFilter) ->
    restrict: 'E'
    transclude: true
    replace: true
    templateUrl: 'pvdm-dropdown-filter.html'
  )

  .directive( 'dropdownFilter', (dropdownFilter) ->
    restrict: 'A'
    link: (scope, elem, attr) ->
      elem.bind( 'click', ($event) ->
        if $event.stopPropagation then $event.stopPropagation()
        return
      )
      scope.$watch( ->
        dropdownFilter.active
      , (newValue, oldValue) ->
        if !angular.isUndefined(newValue)
          if newValue
            elem.addClass('active')
          else
            elem.removeClass('active')
      )
  )

  .directive( 'dropdownFilterToggle', ($document, dropdownFilter) ->
    restrict: 'A'
    link: (scope, elem, attr) ->
      elem.bind( 'click', ($event) ->
        scope.$apply( ->
          dropdownFilter.toggle()
        )
        return
      )
      $document.bind( 'click', ($event) ->
        scope.$apply( ->
          dropdownFilter.deactivate()
        )
        return
      )
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
    $rootScope.$on( '$stateChangeStart', (evt, toState, toParams, fromState, fromParams) ->
      dropdownFilter.deactivate()
    )
  )