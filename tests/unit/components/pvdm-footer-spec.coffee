"use strict"

describe("Unit Test => Components =>", ->

  describe("pvdmFooter =>", ->

    scope = component = {}

    beforeEach( ->
      module("abaqis.components")
      module("mockTemplates")
      inject( ($injector, $compile, $rootScope) ->
        scope = $rootScope
        component = $compile('<pvdm-footer></pvdm-footer>')(scope)
      )
    )

    it("should provide component", ->
      scope.$digest()
      expect( component.hasClass("pvdm-footer") ).toBe(true)
    )

  )
)
