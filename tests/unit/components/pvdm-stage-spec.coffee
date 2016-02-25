  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmStage =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          scope.active = true
          component = $compile('<pvdm-stage active="active">transclude this</pvdm-stage>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-stage") ).toBe(true)
        expect( component.find(".pvdm-stage-content").size() ).toBe(1)
        expect( component.find(".pvdm-stage-toggle").size() ).toBe(1)
      )

      it("should be 'active' if active is TRUE", ->
        scope.$digest()
        expect( component.hasClass("active") ).toBe(true)
        expect( component.hasClass("inactive") ).toBe(false)
      )

      it("should be 'inactive' if active is FALSE", ->
        scope.active = false
        scope.$digest()
        expect( component.hasClass("active") ).toBe(false)
        expect( component.hasClass("inactive") ).toBe(true)
      )

      it("should transclude content", ->
        scope.$digest()
        expect( component.find(".pvdm-stage-content").text().trim() ).toEqual("transclude this")
      )

    )
  )
