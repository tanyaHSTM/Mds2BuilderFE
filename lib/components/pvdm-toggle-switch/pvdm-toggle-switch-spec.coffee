'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmToggleSwitch =>', ->

    scope = component = {}

    beforeEach( ->
      module('mockTemplates')
      module('pascalprecht.translate')
      module('pvdm.components')
      inject( ($rootScope, $compile) ->
        scope = $rootScope
        scope.model = false
        component = $compile('<pvdm-toggle-switch model="model"></pvdm-toggle-switch>')(scope)
        scope.$digest()
      )
    )

    it('should provide component', ->
      expect( component.find('.pvdm-toggle-switch').length ).toBe(1)
    )

    it('should have "on" label', ->
      expect( component.find('.pvdm-toggle-label-on').size() ).toEqual(1)
    )

    it('should have "off" label', ->
      expect( component.find('.pvdm-toggle-label-off').size() ).toEqual(1)
    )

    it('should have thumb', ->
      expect( component.find('.pvdm-toggle-thumb').size() ).toEqual(1)
    )

    it('should show "on" label when model is true', ->
      scope.$apply( ->
        scope.model = true
      )
      expect( component.find('.on').length ).toBe(1)
      expect( component.find('.off').length ).toBe(0)
    )

    it('should show "off" label when model is false', ->
      scope.$apply( ->
        scope.model = false
      )
      expect( component.find('.on').length ).toBe(0)
      expect( component.find('.off').length ).toBe(1)
    )

  )
)
