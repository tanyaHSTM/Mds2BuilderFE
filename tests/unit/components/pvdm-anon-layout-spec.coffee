  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmAnonLayout =>", ->

      scope = component = {}

      beforeEach( ->
        module("abaqis.session")
        module("abaqis.components")
        module("mockTemplates")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          component = $compile("<pvdm-anon-layout></pvdm-anon-layout>")(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-anon-layout") ).toBe(true)
      )

    )
  )
