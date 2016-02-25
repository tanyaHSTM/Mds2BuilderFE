"use strict"

describe("Unit Test => Components =>", ->

  describe("userAccessIcons =>", ->

    component = scope = ROLES = ACCESS = {}

    beforeEach( ->
      module("mockTemplates")
      module("abaqis.directives")
      module("abaqis.constants")
      module("abaqis.components")
      module("pascalprecht.translate")
      inject( ($compile, ACCESS, ROLES, $rootScope) ->
        ROLES = ROLES
        ACCESS = ACCESS
        component = angular.element('<user-access-icons user="user"></user-access-icons>')
        scope = $rootScope
        scope.user = {permissionIds: []}
        $compile(component)(scope)
        scope.$digest()
      )
    )

    it("should provide component with 6 access icons", ->
      scope.$apply( ->
        scope.user.permissionIds = ROLES.CORPORATE_ADMIN
      )
      expect( component.hasClass("user-access-icons") ).toBe(true)
      expect( component.find(".user-access-icon").length ).toEqual(6)
    )

    it("should show Corporate Admin icon if id present in 'permission_ids' array", ->
      scope.$apply( ->
        scope.user.permissionIds = [ACCESS.CORPORATE_ADMIN]
      )
      icon = component.find(".user-access-icon-corporate-admin")
      expect( icon.hasClass("ng-hide") ).toBe(false)
    )

    it("should show Facility Admin icon if id present in 'permission_ids' array", ->
      scope.$apply( ->
        scope.user.permissionIds = [ACCESS.FACILITY_ADMIN]
      )
      icon = component.find(".user-access-icon-facility-admin")
      expect( icon.hasClass("ng-hide") ).toBe(false)
    )

    it("should show QA Admin icon if id present in 'permission_ids' array", ->
      scope.$apply( ->
        scope.user.permissionIds = [ACCESS.QA_ADMIN]
      )
      icon = component.find(".user-access-icon-qa-admin")
      expect( icon.hasClass("ng-hide") ).toBe(false)
    )

    it("should show Stage 1 icon if id present in 'permission_ids' array", ->
      scope.$apply( ->
        scope.user.permissionIds = [ACCESS.STAGE_1]
      )
      icon = component.find(".user-access-icon-stage-1")
      expect( icon.hasClass("ng-hide") ).toBe(false)
    )

    it("should show Stage 2 icon if id present in 'permission_ids' array", ->
      scope.$apply( ->
        scope.user.permissionIds = [ACCESS.STAGE_2]
      )
      icon = component.find(".user-access-icon-stage-2")
      expect( icon.hasClass("ng-hide") ).toBe(false)
    )

    it("should show Reports icon if id present in 'permission_ids' array", ->
      scope.$apply( ->
        scope.user.permissionIds = [ACCESS.REPORTS]
      )
      icon = component.find(".user-access-icon-reports")
      expect( icon.hasClass("ng-hide") ).toBe(false)
    )

  )

)