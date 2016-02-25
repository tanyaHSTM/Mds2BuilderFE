  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmTableBar =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          scope.active = true
          component = $compile('<pvdm-table-bar>transclude this</pvdm-table-bar>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-table-bar") ).toBe(true)
      )

      it("should transclude content", ->
        scope.$digest()
        expect( component.text().trim() ).toEqual("transclude this")
      )

    )
  )
