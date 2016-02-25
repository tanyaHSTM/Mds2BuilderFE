"use strict"

describe("Unit Test => Models => User =>", ->

  $scope = null

  beforeEach(->
    module("validation.match")
    module("ui.router")
    module("rails")
    module("ngIdle")
    module("pascalprecht.translate")
    module("pvdmNotifications")
    module("abaqis.constants")
    module("abaqis.services")
    module("abaqis.manage.users")
    inject(($rootScope, ACCESS, ROLES, RailsResource, User) ->
      $scope = $rootScope
      $scope.user = new User()
      $scope.ACCESS = ACCESS
      $scope.ssoUser = new User(ssoId: "12121212")
      $scope.stage1User = new User(permissionIds: ACCESS.STAGE_1)
      $scope.corpAdminUser = new User(permissionIds: [ACCESS.CORPORATE_ADMIN])
      $scope.facilityAdminUser = new User(permissionIds: [ACCESS.FACILITY_ADMIN])
    )
  )

  it("should contain empty permissions when instantiated", ->
    expect(_.isEqual($scope.user.permissionIds, [])).toBe(true)
  )

  it("should contain empty facility ids when instantiated", ->
    expect(_.isEqual($scope.user.facilityIds, [])).toBe(true)
  )

  it("makeCorpAdmin should add the CORPORATE_ADMIN to user's permission", ->
    $scope.user.makeCorpAdmin()
    expect(_.includes($scope.user.permissionIds,$scope.ACCESS.CORPORATE_ADMIN)).toBe(true)
  )

  it("makeQaAdmin() should add the QA_ADMIN to user's permission", ->
    $scope.user.makeQaAdmin()
    expect(_.includes($scope.user.permissionIds,$scope.ACCESS.QA_ADMIN)).toBe(true)
  )

  it("user can't manage a SSO user", ->
    expect($scope.user.canManage($scope.ssoUser)).toBe(false)
  )

  it("qa admin user can't manage another user", ->
    expect($scope.user.canManage($scope.stage1User)).toBe(false)
  )

  it("user can't manage a corporate admin user", ->
    $scope.user.permissionIds = [$scope.ACCESS.FACILITY_ADMIN]
    expect($scope.user.canManage($scope.corpAdminUser)).toBe(false)
  )

  it("corp admin user can manage another corporate admin user", ->
    $scope.user.permissionIds = [$scope.ACCESS.CORPORATE_ADMIN]
    expect($scope.user.canManage($scope.corpAdminUser)).toBe(true)
  )

  it("corp admin user can manage facility admin user", ->
    $scope.user.permissionIds = [$scope.ACCESS.CORPORATE_ADMIN]
    expect($scope.user.canManage($scope.facilityAdminUser)).toBe(true)
  )


  it("user can't manage another user that doesn't have all the same facilities as the user", ->
    $scope.user.permissionIds = [$scope.ACCESS.STAGE_1]
    $scope.user.facilityIds   = [1,2,3,4]
    $scope.stage1User.facilityIds = [3,4,5,6]
    expect($scope.user.canManage($scope.stage1User)).toBe(false)
  )

  it("user can manage another user that has all the same facilities as the user", ->
    $scope.user.permissionIds = [$scope.ACCESS.STAGE_1]
    $scope.user.facilityIds   = [1,2,3,4]
    $scope.stage1User.facilityIds = [4,3,2,1]
    expect($scope.user.canManage($scope.stage1User)).toBe(false)
  )

  it("unassignFacility should remove the facility id from the user", ->
    $scope.user.permissionIds = [$scope.ACCESS.STAGE_1]
    $scope.user.facilityIds   = [1,2,3,4]
    $scope.user.unassignFacility([2,3])
    expect(_.includes($scope.user.facilityIds, 2)).toBe(false)
    expect(_.includes($scope.user.facilityIds, 3)).toBe(false)
    expect(_.includes($scope.user.facilityIds, 1)).toBe(true)
    expect(_.includes($scope.user.facilityIds, 4)).toBe(true)
  )



)
