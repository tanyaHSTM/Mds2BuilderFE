"use strict"

describe("Unit Test => Components =>", ->

  describe("assessmentProgressIcons =>", ->

#    component = scope = compile = {}
    component = null
    scope = null

    beforeEach( ->
      module("mockTemplates")
      module("abaqis.components")
      module("pascalprecht.translate")
      module("pvdmDirectives")
      inject( ($compile, $rootScope) ->
        scope = $rootScope
        compile = $compile
        component = compile(angular.element('<assessment-progress-icons resident="resident"></assessment-progress-icons>'))(scope)
        scope.$digest()
      )
    )

    it("should contain icon for each assessment type defined", ->
      scope.$apply( ->
        scope.resident =
          riComplete: null
          fiComplete: null
          roComplete: null
          siComplete: null
          crComplete: null
      )
      expect( component.find(".pvdm-progress-icon").size() ).toBe(5)
      scope.$apply( ->
        scope.resident =
          arComplete: null
      )
      expect( component.find(".pvdm-progress-icon").size() ).toBe(1)
    )

  )

)