  "use strict"

  describe("Unit Test => Components =>", ->

    describe("facilityFilterComponent =>", ->

      scope = component = {}
      facilities = [
        {id:1, name: "one"},
        {id:2, name: "two"},
        {id:3, name: "three"}
      ]

      beforeEach( ->
        module("mockTemplates")
        module("pascalprecht.translate")
        module("ui.router")
        module("rails")
        module("angular-locker")
        module("abaqis.services")
        module("abaqis.components")
        module("abaqis.manage.facilities")
        module("abaqis.manage.residents")
        module("abaqis.constants")
        inject( ($rootScope, $compile, FilterParametersManager) ->
          scope = $rootScope
          scope.facilities = facilities
          scope.filterManager = new FilterParametersManager()
          component = $compile('<facility-filter-component facilities="facilities" filter-manager="filterManager"></facility-filter-component>')(scope)
          scope.$digest()
        )
      )

      it("should provide component", ->
        expect( component.hasClass("facility-filter-component") ).toBe(true)
      )

      it("should update filter params when facility is selected", ->
        component.find("#qa-filter-for-facility-3").click()
        expect( scope.filterManager.params.facility.label ).toEqual("three")
      )

    )
  )
