'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmHeaderActions =>', ->

    scope = component = {}

    beforeEach( ->
      module('pvdm.components')
      module('mockTemplates')
      inject( ($injector, $compile, $rootScope) ->
        scope = $rootScope
        component = $compile('<pvdm-header-actions>transclude</pvdm-header-actions>')(scope)
        scope.$digest()
      )
    )

    it('should provide component', ->
      expect( component.find('.pvdm-header-actions').length ).toBe(1)
    )

    it('should transclude content', ->
      expect( component.text().trim() ).toEqual('transclude')
    )

  )
)
