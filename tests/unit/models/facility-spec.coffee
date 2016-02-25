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
    module("abaqis.manage.facilities")
    module("abaqis.manage.residents")
    inject(($rootScope, ACCESS, ROLES, RailsResource, Facility, Resident) ->
      $scope = $rootScope
      $scope.facility = new Facility()
    )
  )

  it("unassignUser() should remove the user from the facility ", ->
    $scope.facility.userIds = [12,35,15,22]
    $scope.facility.unassignUser([35])
    expect(_.includes($scope.facility.userIds, 35)).toBe(false)
  )




)
