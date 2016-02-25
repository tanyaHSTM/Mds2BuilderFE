  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmRecordDetail =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope.$new()
          component = $compile('<pvdm-record-detail label="{{label}}" value="{{value}}"></pvdm-record-detail>')(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-record-detail") ).toBe(true)
      )

      it("should use given label/value", ->
        scope.value = "bar"
        scope.label = "foo"
        scope.$digest()
        expect( component.find(".pvdm-record-detail-value").text() ).toBe("bar")
        expect( component.find(".pvdm-record-detail-label").text() ).toBe("foo")
      )

      it("should use '--' for empty value", ->
        scope.value = ""
        scope.$digest()
        expect( component.find(".pvdm-record-detail-value").text() ).toBe("--")
      )

    )
  )
