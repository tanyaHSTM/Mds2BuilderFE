  "use strict"

  describe("Unit Test => Components =>", ->

    describe("residentGroupFilterComponent =>", ->

      scope = component = {}
      groups = [
        {id:1, name: "one"},
        {id:2, name: "two"},
        {id:3, name: "three"}
      ]

      beforeEach( ->
        module("abaqis.services")
        module("abaqis.components")
        module("abaqis.constants")
        module("mockTemplates")
        module("pascalprecht.translate")
        inject( ($rootScope, $compile, FilterParametersManager) ->
          scope = $rootScope
          scope.groups = groups
          scope.filterManager = new FilterParametersManager()
          component = $compile('<resident-group-filter-component groups="groups" filter-manager="filterManager"></resident-group-filter-component>')(scope)
          scope.$digest()
        )
      )

      it("should provide component", ->
        expect( component.hasClass("resident-group-filter-component") ).toBe(true)
      )

      it("should add option for each sample", ->
        expect( component.find("option").size() ).toEqual(4)
      )

    )
  )
