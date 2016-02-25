  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmPrimaryLayout =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("pascalprecht.translate")
        module("ui.router")
        module("pvdmNotifications")
        module("ngIdle")
        module("abaqis.services")
        module("abaqis.auth")
        module("abaqis.session")
        module("abaqis.components")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          component = $compile("<pvdm-primary-layout></pvdm-primary-layout>")(scope)
        )
      )

      it("should provide component", ->
        scope.$digest()
        expect( component.hasClass("pvdm-primary-layout") ).toBe(true)
      )

    )
  )
