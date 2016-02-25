  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmTrowserFooter =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          scope.active = true
          component = $compile('<pvdm-trowser-footer>transclude this</pvdm-trowser-footer>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-trowser-footer") ).toBe(true)
        expect( component.find(".pvdm-trowser-footer-actions").size() ).toBe(1)
      )

      it("should transclude content", ->
        scope.$digest()
        expect( component.text().trim() ).toEqual("transclude this")
      )

    )
  )
