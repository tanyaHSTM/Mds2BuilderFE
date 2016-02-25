"use strict"

describe("Unit Test => Components =>", ->

  describe("pvdmHeaderActions =>", ->

    scope = component = {}

    beforeEach( ->
      module("abaqis.components")
      module("mockTemplates")
      inject( ($injector, $compile, $rootScope) ->
        scope = $rootScope
        component = $compile('<pvdm-header-actions>transclude</pvdm-header-actions>')(scope)
        scope.$digest()
      )
    )

    it("should provide component", ->
      expect( component.hasClass("pvdm-header-actions") ).toBe(true)
    )

    it("should transclude content", ->
      expect( component.text().trim() ).toEqual("transclude")
    )

  )
)
