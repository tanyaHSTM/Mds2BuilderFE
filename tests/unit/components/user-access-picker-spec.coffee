"use strict"

describe("Unit Test => Components =>", ->

  describe("userAccessPicker =>", ->

    component = scope = null
    groups = [
      {id:1, name: "one"},
      {id:2, name: "two"},
      {id:3, name: "three"},
      {id:4, name: "four"},
      {id:5, name: "five"}
    ]

    beforeEach( ->
      module("mockTemplates")
      module("pascalprecht.translate")
      module("ui.router")
      module("rails")
      module("ngIdle")
      module("pvdmNotifications")
      module("abaqis.services")
      module("abaqis.directives")
      module("abaqis.constants")
      module("abaqis.components")
      module("abaqis.manage.users")
      inject( ($compile, $rootScope, User) ->
        component = angular.element('<user-access-picker user="user"></user-access-picker>')
        scope = $rootScope
        scope.user = new User()
        $compile(component)(scope)
        scope.$digest()
      )
    )

    it("should provide table component w/6 rows", ->
      scope.$apply( ->
        scope.user.permissionIds = []
      )
      expect( component.hasClass("user-access-picker") ).toBe(true)
      expect( component.find("tbody tr").size() ).toBe(6)
    )

    it("should toggle Corporate Admin when 1st switch is clicked", inject( (_, ROLES) ->
      scope.$apply( ->
        scope.user.permissionIds = []
      )
      component.find(".pvdm-toggle-switch").eq(0).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), ROLES.CORPORATE_ADMIN) ).toBe(true)
      component.find(".pvdm-toggle-switch").eq(0).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), [2,3,4,5,6]) ).toBe(true)
    ))

    it("should toggle Facility Admin when 2nd switch is clicked", inject( (_, ROLES) ->
      scope.$apply( ->
        scope.user.permissionIds = []
      )
      component.find(".pvdm-toggle-switch").eq(1).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), ROLES.FACILITY_ADMIN) ).toBe(true)
      component.find(".pvdm-toggle-switch").eq(1).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), []) ).toBe(true)
    ))

    it("should toggle QA Admin when 3rd switch is clicked", inject( (_, ROLES) ->
      scope.$apply( ->
        scope.user.permissionIds = []
      )
      component.find(".pvdm-toggle-switch").eq(2).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), ROLES.QA_ADMIN) ).toBe(true)
      component.find(".pvdm-toggle-switch").eq(2).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), [3,4,6]) ).toBe(true)
    ))

    it("should toggle Stage 1 when 4th switch is clicked", inject( (_, ROLES) ->
      scope.$apply( ->
        scope.user.permissionIds = []
      )
      component.find(".pvdm-toggle-switch").eq(3).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), ROLES.STAGE_1) ).toBe(true)
      component.find(".pvdm-toggle-switch").eq(3).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), []) ).toBe(true)
    ))

    it("should toggle Stage 2 when 5th switch is clicked", inject( (_, ROLES) ->
      scope.$apply( ->
        scope.user.permissionIds = []
      )
      component.find(".pvdm-toggle-switch").eq(4).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), ROLES.STAGE_2) ).toBe(true)
      component.find(".pvdm-toggle-switch").eq(4).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), []) ).toBe(true)
    ))

    it("should toggle Reports when 6th switch is clicked", inject( (_, ROLES) ->
      scope.$apply( ->
        scope.user.permissionIds = []
      )
      component.find(".pvdm-toggle-switch").eq(5).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), ROLES.REPORTS) ).toBe(true)
      component.find(".pvdm-toggle-switch").eq(5).click()
      expect( _.isEqual(scope.user.permissionIds.sort(), []) ).toBe(true)
    ))


  )

)