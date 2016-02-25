  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmToggleSwitch =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("pascalprecht.translate")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          scope.model = false
          component = $compile('<pvdm-toggle-switch ng-model="model"></pvdm-toggle-switch>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-toggle-switch") ).toBe(true)
      )

      it("should have 'on' label", ->
        scope.$digest()
        expect( component.find(".pvdm-toggle-label-on").size() ).toEqual(1)
      )

      it("should have 'off' label", ->
        scope.$digest()
        expect( component.find(".pvdm-toggle-label-off").size() ).toEqual(1)
      )

      it("should have thumb", ->
        scope.$digest()
        expect( component.find(".pvdm-toggle-thumb").size() ).toEqual(1)
      )

      it("should show 'on' label when model is true", ->
        scope.model = true
        scope.$digest()
        expect( component.hasClass("on") ).toBe(true)
        expect( component.hasClass("off") ).toBe(false)
      )

      it("should show 'off' label when model is false", ->
        scope.model = false
        scope.$digest()
        expect( component.hasClass("on") ).toBe(false)
        expect( component.hasClass("off") ).toBe(true)
      )

    )
  )
