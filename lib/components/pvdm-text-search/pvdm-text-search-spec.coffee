'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmTextSearch =>', ->

    scope = component = {}

    beforeEach( ->
      module('mockTemplates')
      module('pascalprecht.translate')
      module('pvdm.components')
      inject( ($rootScope, $compile) ->
        scope = $rootScope
        scope.search = ''
        component = $compile('<pvdm-text-search model="search"></pvdm-text-search>')(scope)
        scope.$digest()
      )
    )

    it('should provide component', ->
      expect( component.find('.pvdm-text-search').length ).toBe(1)
    )

    it('should have input', ->
      expect( component.find('.pvdm-text-search-input').size() ).toEqual(1)
    )

    it('should have search icon', ->
      expect( component.find('.pvdm-text-search-icon').size() ).toEqual(1)
    )

    it('should have clear button', ->
      expect( component.find('.pvdm-text-search-clear').size() ).toEqual(1)
    )

    it('should show clear button/hide search icon when text entered', ->
      scope.$apply( ->
        scope.search = 'text'
      )
      icon = component.find('.pvdm-text-search-icon')
      clear = component.find('.pvdm-text-search-clear')
      expect( icon.hasClass('ng-hide') ).toBe(true)
      expect( clear.hasClass('ng-hide') ).toBe(false)
    )

    it('should show search icon/hide clear button when text cleared', ->
      scope.$apply( ->
        scope.search = ''
      )
      icon = component.find('.pvdm-text-search-icon')
      clear = component.find('.pvdm-text-search-clear')
      expect( icon.hasClass('ng-hide') ).toBe(false)
      expect( clear.hasClass('ng-hide') ).toBe(true)
    )

  )
)
