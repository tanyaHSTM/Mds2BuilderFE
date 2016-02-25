  "use strict"

  describe("Unit Test => Components =>", ->

    describe("facilityGroupFilterComponent =>", ->

      scope = component = {}
      groups = [
        {id:1, name: "one"},
        {id:2, name: "two"},
        {id:3, name: "three"},
        {id:4, name: "four"},
        {id:5, name: "five"}
      ]

      beforeEach( ->
        module("pascalprecht.translate")
        module("mockTemplates")
        module("ui.router")
        module("abaqis.services")
        module("abaqis.components")
        module("abaqis.manage.facilityGroups")
        module("abaqis.constants")
        inject( ($rootScope, $compile, FilterParametersManager) ->
          scope = $rootScope
          scope.groups = groups
          scope.filterManager = new FilterParametersManager()
          component = $compile('<facility-group-filter-component groups="groups" filter-manager="filterManager"></facility-group-filter-component>')(scope)
          scope.$digest()
        )
      )

      it("should provide component", ->
        expect( component.hasClass("facility-group-filter-component") ).toBe(true)
      )

      it("should update filter params when group is selected", ->
        component.find("#qa-filter-for-group-3").click()
        expect( scope.filterManager.params.group.label ).toEqual("three")
      )

    )
  )
