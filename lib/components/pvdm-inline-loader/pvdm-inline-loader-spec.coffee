'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmInlineLoader =>', ->

    scope = component = {}

    beforeEach( ->
      module('pvdm.components')
      module('mockTemplates')
      inject( ($compile, $rootScope) ->
        scope = $rootScope
        directive = '<pvdm-inline-loader loading="loading" message="Loading..."></pvdm-inline-loader>'
        component = $compile(directive)(scope)
      )
    )

    it('should provide component with link, text and icon', ->
      scope.$digest()
      expect( component.find('.pvdm-inline-loader').length ).toBe(1)
      expect( component.find('.inline-loader-icon').length ).toEqual(1)
      expect( component.find('.inline-loader-text').length ).toEqual(1)
    )

    it('should be "active" if "loading" is TRUE', ->
      scope.loading = true
      scope.$digest()
      expect( component.find('.pvdm-inline-loader').hasClass('active') ).toBe(true)
    )

    it('should not be "active" if "loading" is FALSE', ->
      scope.loading = false
      scope.$digest()
      expect( component.find('.pvdm-inline-loader').hasClass('active') ).toBe(false)
    )

  )
)
