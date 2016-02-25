  "use strict"

  describe("Unit Test => Components =>", ->

    describe("pvdmDropdownFilter =>", ->

      scope = component = {}

      beforeEach( ->
        module("abaqis.components")
        module("mockTemplates")
        inject( ($rootScope, $compile) ->
          scope = $rootScope
          component = $compile("<pvdm-dropdown-filter></pvdm-dropdown-filter>")(scope)
          scope.$digest()
        )
      )

      it("should provide component", ->
        expect( component.hasClass("pvdm-dropdown-filter") ).toBe(true)
      )

      it("should toggle menu when clicked", ->
        component.find(".uib-dropdown-toggle").click()
        expect( component.find(".dropdown-filter-wrapper").hasClass("active") ).toBe(true)
        component.find(".uib-dropdown-toggle").click()
        expect( component.find(".dropdown-filter-wrapper").hasClass("active") ).toBe(false)
      )

      it("should hide menu when user clicks outside of it", ->
        component.find(".uib-dropdown-toggle").click()
        expect( component.find(".dropdown-filter-wrapper").hasClass("active") ).toBe(true)
        jQuery(document).click()
        expect( component.find(".dropdown-filter-wrapper").hasClass("active") ).toBe(false)
      )

    )
  )
