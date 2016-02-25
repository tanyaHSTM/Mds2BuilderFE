"use strict"

describe("Unit Test => Components =>", ->

  describe("pvdmLogo =>", ->

    scope = component = {}

    beforeEach( ->
      module("abaqis.session")
      module("abaqis.components")
      module("mockTemplates")
      inject( ($injector, $compile, $rootScope) ->
        scope = $rootScope
        component = $compile('<pvdm-logo></pvdm-logo>')(scope)
      )
    )

    it("should provide logo component", ->
      scope.$digest()
      expect( component.hasClass("pvdm-logo") ).toBe(true)
      expect( component.text() ).toEqual("abaqis")
    )

  )
)
