  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmNavIcon =>", ->

      scope = component = nav = session = {}

      beforeEach( ->
        module("abaqis.services")
        module("abaqis.session")
        module("abaqis.components")
        module("mockTemplates")
        inject( ($rootScope, $compile, offCanvasNav, SessionFactory) ->
          scope = $rootScope
          nav = offCanvasNav
          session = SessionFactory
          component = $compile("<pvdm-nav-icon></pvdm-nav-icon>")(scope)
        )
      )

      it("should provide icon component", ->
        session.valid = true
        scope.$digest()
        expect( component.hasClass("pvdm-nav-icon") ).toBe(true)
        expect( component.find("span.line").length ).toEqual(3)
      )

      it("should be 'active' if offCanvasNav.active is TRUE", ->
        session.valid = true
        nav.activate()
        scope.$digest()
        expect( component.find(".pvdm-nav-icon--link").hasClass("active") ).toBe(true)
      )

      it("should not be 'active' if offCanvasNav.active is FALSE", ->
        session.valid = true
        nav.deactivate()
        scope.$digest()
        expect( component.find(".pvdm-nav-icon--link").hasClass("active") ).toBe(false)
      )

    )
  )
