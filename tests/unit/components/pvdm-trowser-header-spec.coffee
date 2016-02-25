  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmTrowserHeader =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          scope.active = true
          component = $compile('<pvdm-trowser-header></pvdm-trowser-header>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-trowser-header") ).toBe(true)
        expect( component.find(".pvdm-trowser-title").size() ).toBe(1)
        expect( component.find(".pvdm-trowser-header-actions").size() ).toBe(1)
      )

    )
  )
