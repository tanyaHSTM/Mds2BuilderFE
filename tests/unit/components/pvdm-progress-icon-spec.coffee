"use strict"

describe("Unit Test => Components =>", ->

  describe("pvdmProgressIcon =>", ->

    scope = compile = null

    getComponent = (complete) ->
      scope.complete = complete
      component = compile(angular.element('<pvdm-progress-icon complete="{{complete}}"></pvdm-progress-icon>'))(scope)
      scope.$digest()
      component

    beforeEach( ->
      module("mockTemplates")
      module("abaqis.components")
      module("pascalprecht.translate")
      module("pvdmDirectives")
      inject( ($compile, $rootScope) ->
        scope = $rootScope
        compile = $compile
      )
    )

    it("should provide component", ->
      component = getComponent()
      expect( component.hasClass("pvdm-progress-icon") ).toBe(true)
    )

    it("should show correct icon for 'not started' status", ->
      component = getComponent()
      expect( component.find(".glyphicon-circle-minus").size() ).toBe(1)
    )

    it("should show correct icon for 'complete' status", ->
      component = getComponent("Yes")
      expect( component.find(".glyphicon-circle-ok").size() ).toBe(1)
    )

    it("should show correct icon for 'incomplete' status", ->
      component = getComponent("No")
      expect( component.find(".glyphicon-adjust").size() ).toBe(1)
    )

  )

)