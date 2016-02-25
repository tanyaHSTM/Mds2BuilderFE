  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmSiteHeader =>", ->

      scope = component = {}

      beforeEach( ->
        module("mockTemplates")
        module("ui.router")
        module("pascalprecht.translate")
        module("pvdmNotifications")
        module("ngIdle")
        module("abaqis.auth")
        module("abaqis.components")
        module("abaqis.session")
        module("abaqis.services")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          component = $compile("<pvdm-site-header></pvdm-site-header>")(scope)
          scope.$digest()
        )
      )

      it("should provide component", ->
        expect( component.hasClass("pvdm-site-header") ).toBe(true)
      )

      it("should provide nav icon", ->
        expect( component.find(".pvdm-nav-icon").size() ).toBe(1)
      )

      it("should provide logo", ->
        expect( component.find(".pvdm-logo").size() ).toBe(1)
      )

    )
  )
