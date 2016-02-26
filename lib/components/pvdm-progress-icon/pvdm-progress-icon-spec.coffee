'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmProgressIcon =>', ->

    scope = compile = null

    getComponent = (complete) ->
      scope.complete = complete
      component = compile(angular.element('<pvdm-progress-icon complete="{{complete}}" label="Test Label"></pvdm-progress-icon>'))(scope)
      scope.$digest()
      component

    beforeEach( ->
      module('mockTemplates')
      module('pascalprecht.translate')
      module('pvdm.components')
      module('pvdm.directives')
      inject( ($compile, $rootScope) ->
        scope = $rootScope
        compile = $compile
      )
    )

    it('should provide component', ->
      component = getComponent()
      expect( component.find('.pvdm-progress-icon').length ).toBe(1)
    )

    it('should show correct icon for "not started" status', ->
      component = getComponent()
      expect( component.find('.glyphicon-circle-minus').length ).toBe(1)
    )

    it('should show correct icon for "complete" status', ->
      component = getComponent('Yes')
      expect( component.find('.glyphicon-circle-ok').length ).toBe(1)
    )

    it('should show correct icon for "incomplete" status', ->
      component = getComponent('No')
      expect( component.find('.glyphicon-adjust').length ).toBe(1)
    )

  )

)