  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmFilterTabs =>", ->

      scope = component = {}

      beforeEach( ->
        module("abaqis.components")
        module("abaqis.services")
        module("mockTemplates")
        module("pascalprecht.translate")
        inject( ($rootScope, $compile, FilterParametersManager) ->
          scope = $rootScope
          scope.filterManager = new FilterParametersManager()
          component = $compile('<pvdm-filter-tabs filter-manager="filterManager"></pvdm-filter-tabs>')(scope)
          scope.$digest()
        )
      )

      it("should provide component", ->
        expect( component.hasClass("pvdm-filter-tabs") ).toBe(true)
      )

      it("should show tab for filter manager entries", ->
        scope.filterManager.set("test","test","test")
        scope.$digest()
        expect( component.find(".pvdm-filter-tab").size() ).toBe(1)
      )

      it("should remove params from filter manager when tabs are closed", ->
        scope.filterManager.set("test","test","test")
        scope.$digest()
        component.find(".pvdm-filter-tab-remove").click()
        expect( component.find(".pvdm-filter-tab").size() ).toBe(0)
      )

    )
  )
