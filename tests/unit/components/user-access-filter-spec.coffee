  "use strict"

  describe("Unit Test => Components =>", ->

    describe("userAccessFilter =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("pascalprecht.translate")
        module("abaqis.filters")
        module("abaqis.services")
        module("abaqis.constants")
        module("abaqis.components")
        inject( ($rootScope, $compile, FilterParametersManager) ->
          scope = $rootScope
          scope.active = true
          scope.filterManager = new FilterParametersManager()
          component = $compile('<user-access-filter-component filter-manager="filterManager"></user-access-filter-component>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("user-access-filter-component") ).toBe(true)
      )

      it("should add option for each access level", ->
        scope.$digest()
        expect( component.find("input").size() ).toEqual(6)
      )

    )
  )
