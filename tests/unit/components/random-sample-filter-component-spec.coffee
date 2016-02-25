  "use strict"

  describe("Unit Test => Components =>", ->

    describe("randomSampleFilterComponent =>", ->

      scope = component = {}
      samples = [
        {id:1, name: "one"},
        {id:2, name: "two"},
        {id:3, name: "three"}
      ]

      beforeEach( ->
        module("mockTemplates")
        module("pascalprecht.translate")
        module("abaqis.services")
        module("abaqis.components")
        inject( ($rootScope, $compile, FilterParametersManager, $httpBackend) ->
          scope = $rootScope.$new()
          scope.samples = samples
          scope.filterManager = new FilterParametersManager()
          component = $compile('<random-sample-filter-component filter-manager="filterManager" samples="samples"></random-sample-filter-component>')(scope)
          scope.$digest()
        )
      )

      it("should provide component", ->
        expect( component.hasClass("random-sample-filter-component") ).toBe(true)
      )

      it("should add option for each sample", ->
        expect( component.find("option").size() ).toEqual(4)
      )

    )
  )
