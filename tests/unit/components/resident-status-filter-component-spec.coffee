"use strict"

describe("Unit Test => Components =>", ->

  describe("residentStatusFilterComponent =>", ->

    scope = component = {}

    beforeEach( ->
      module("mockTemplates")
      module("pascalprecht.translate")
      module("abaqis.filters")
      module("abaqis.services")
      module("abaqis.components")
      module("abaqis.constants")
      inject( ($rootScope, $compile, FilterParametersManager) ->
        scope = $rootScope
        scope.filterManager = new FilterParametersManager()
        component = $compile('<resident-status-filter-component filter-manager="filterManager"></resident-status-filter-component>')(scope)
        scope.$digest()
      )
    )

    it("should provide component", ->
      expect( component.hasClass("resident-status-filter-component") ).toBe(true)
    )

  )
)
