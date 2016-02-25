  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmTextSearch =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("pascalprecht.translate")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          scope.search = ""
          component = $compile('<pvdm-text-search model="search"></pvdm-text-search>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-text-search") ).toBe(true)
      )

      it("should have input", ->
        scope.$digest()
        expect( component.find(".pvdm-text-search-input").size() ).toEqual(1)
      )

      it("should have search icon", ->
        scope.$digest()
        expect( component.find(".pvdm-text-search-icon").size() ).toEqual(1)
      )

      it("should have clear button", ->
        scope.$digest()
        expect( component.find(".pvdm-text-search-clear").size() ).toEqual(1)
      )

      it("should show clear button/hide search icon when text entered", ->
        scope.search = "text"
        scope.$digest()
        icon = component.find(".pvdm-text-search-icon")
        clear = component.find(".pvdm-text-search-clear")
        expect( icon.hasClass("ng-hide") ).toBe(true)
        expect( clear.hasClass("ng-hide") ).toBe(false)
      )

      it("should show search icon/hide clear button when text cleared", ->
        scope.search = ""
        scope.$digest()
        icon = component.find(".pvdm-text-search-icon")
        clear = component.find(".pvdm-text-search-clear")
        expect( icon.hasClass("ng-hide") ).toBe(false)
        expect( clear.hasClass("ng-hide") ).toBe(true)
      )

    )
  )
