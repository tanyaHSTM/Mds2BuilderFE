"use strict"

describe("Unit Test => Components =>", ->

  describe("pvdmLoader =>", ->

    scope = component = {}

    beforeEach( ->
      module("abaqis.components")
      module("mockTemplates")
      inject( ($compile, $rootScope) ->
        scope = $rootScope
        directive = '<pvdm-loader loading="loading" message="Loading..."></pvdm-loader>'
        component = $compile(directive)(scope)
      )
    )

    it("should provide component with link, text and icon", ->
      scope.$digest()
      expect( component.hasClass("pvdm-loader") ).toBe(true)
      expect( component.find(".pvdm-loader-icon").length ).toEqual(1)
      expect( component.find(".pvdm-loader-text").length ).toEqual(1)
    )

    it("should be 'active' if 'loading' is TRUE", ->
      scope.loading = true
      scope.$digest()
      expect( component.hasClass("active") ).toBe(true)
    )

    it("should not be 'active' if 'loading' is FALSE", ->
      scope.loading = false
      scope.$digest()
      expect( component.hasClass("active") ).toBe(false)
    )

  )
)
