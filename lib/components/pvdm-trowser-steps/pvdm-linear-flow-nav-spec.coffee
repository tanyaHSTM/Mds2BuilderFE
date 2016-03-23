'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmTrowserSteps =>', ->

    scope = component = {}
    steps = ['one','two','three']
    beforeEach( ->
      module('pvdm.components')
      module('mockTemplates')
      inject( ($injector, $compile, $rootScope) ->
        scope = $rootScope
        scope.steps = steps
        component = $compile('<pvdm-trowser-steps steps="steps" current-step="1"></pvdm-trowser-steps>')(scope)
        scope.$digest()
      )
    )

    it('should provide component', ->
      expect( component.find('.pvdm-trowser-steps').length ).toBe(1)
    )

    it('should provide element for each step', ->
      expect( component.find('.pvdm-trowser-step').size() ).toBe(3)
    )

    it('should number each step', ->
      expect( component.find('.pvdm-trowser-step-number').eq(0).text() ).toBe('1')
      expect( component.find('.pvdm-trowser-step-number').eq(1).text() ).toBe('2')
      expect( component.find('.pvdm-trowser-step-number').eq(2).text() ).toBe('3')
    )

    it('should label each step', ->
      expect( component.find('.pvdm-trowser-step-label').eq(0).text() ).toBe('one')
      expect( component.find('.pvdm-trowser-step-label').eq(1).text() ).toBe('two')
      expect( component.find('.pvdm-trowser-step-label').eq(2).text() ).toBe('three')
    )

  )
)
