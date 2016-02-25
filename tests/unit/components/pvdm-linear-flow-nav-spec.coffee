"use strict"

describe("Unit Test => Components =>", ->

  describe("pvdmLinearFlowNav =>", ->

    scope = component = {}
    steps = [
      {"label":"one"},
      {"label":"two"},
      {"label":"three"}
    ]
    beforeEach( ->
      module("abaqis.components")
      module("mockTemplates")
      inject( ($injector, $compile, $rootScope) ->
        scope = $rootScope
        scope.steps = steps
        component = $compile('<pvdm-linear-flow-nav steps="steps" current-step="0"></pvdm-linear-flow-nav>')(scope)
        scope.$digest()
      )
    )

    it("should provide component", ->
      expect( component.hasClass("pvdm-linear-flow-nav") ).toBe(true)
    )

    it("should provide element for each step", ->
      expect( component.find(".pvdm-lfn-step").size() ).toBe(3)
    )

    it("should number each step", ->
      expect( component.find(".pvdm-lfn-step").eq(0).text() ).toBe('1')
      expect( component.find(".pvdm-lfn-step").eq(1).text() ).toBe('2')
      expect( component.find(".pvdm-lfn-step").eq(2).text() ).toBe('3')
    )

    it("should label each step", ->
      expect( component.find(".pvdm-lfn-step-label").eq(0).text() ).toBe('one')
      expect( component.find(".pvdm-lfn-step-label").eq(1).text() ).toBe('two')
      expect( component.find(".pvdm-lfn-step-label").eq(2).text() ).toBe('three')
    )

  )
)
