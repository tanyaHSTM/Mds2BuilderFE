"use strict"

describe("Unit Test => Components =>", ->

  describe("pvdmMask =>", ->

    scope = component = mask = {}

    beforeEach( ->
      module("abaqis.components")
      module("mockTemplates")
      inject( ($compile, $rootScope) ->
        scope = $rootScope
        component = $compile('<pvdm-mask></pvdm-mask>')(scope)
      )
    )

    it("should provide component", ->
      scope.$digest()
      expect( component.hasClass("pvdm-mask") ).toBe(true)
    )

    it("should be hidden by default", ->
      scope.$digest()
      expect( component.hasClass("ng-hide") ).toBe(true)
    )

    it("should show if activated", inject( (mask)->
      mask.activate()
      scope.$digest()
      expect( component.hasClass("ng-hide") ).toBe(false)
    ))

  )
)
