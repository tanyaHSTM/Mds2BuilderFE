'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmTableBar =>', ->

    scope = component = {}

    beforeEach( ->
      module('mockTemplates')
      module('pvdm.components')
      inject( ($rootScope, $compile) ->
        scope = $rootScope
        scope.active = true
        component = $compile('<pvdm-table-bar>transclude this</pvdm-table-bar>')(scope)
        scope.$digest()
      )
    )

    it('should provide component', ->
      expect( component.find('.pvdm-table-bar').length ).toBe(1)
    )

    it('should transclude content', ->
      expect( component.text().trim() ).toEqual('transclude this')
    )

  )
)
