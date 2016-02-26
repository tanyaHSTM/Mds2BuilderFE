'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmStage =>', ->

    scope = component = {}

    beforeEach( ->
      module('mockTemplates')
      module('pvdm.components')
      inject( ($rootScope, $compile) ->
        scope = $rootScope
        scope.active = true
        component = $compile('<pvdm-stage active="active">transclude this</pvdm-stage>')(scope)
      )
    )

    it('should provide component', ->
      scope.$digest()
      expect( component.find('.pvdm-stage').length ).toBe(1)
      expect( component.find('.pvdm-stage-content').length ).toBe(1)
      expect( component.find('.pvdm-stage-toggle').length ).toBe(1)
    )

    it('should be "active" if active is TRUE', ->
      scope.$apply(->
        scope.active = true
      )
      expect( component.find('.active').length ).toBe(1)
    )

    it('should be "inactive" if active is FALSE', ->
      scope.$apply(->
        scope.active = false
      )
      expect( component.find('.active').length ).toBe(0)
    )

    it('should transclude content', ->
      scope.$apply(->
        scope.active = true
      )
      expect( component.find('.pvdm-stage-content').text().trim() ).toEqual('transclude this')
    )

  )
)
