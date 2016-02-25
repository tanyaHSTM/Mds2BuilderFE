"use strict"

describe("Unit Test => Components =>", ->

  describe("facilityGroupPicker =>", ->

    component = scope = null
    httpLocalBackend = null
    groups = [
      {id:1, name: "one"},
      {id:2, name: "two"},
      {id:3, name: "three"}
    ]

    beforeEach( ->
      module("mockTemplates")
      module("pascalprecht.translate")
      module("ui.router")
      module("rails")
      module("abaqis.services")
      module("abaqis.constants")
      module("abaqis.components")
      module("abaqis.manage.facilityGroups")
      inject( ($compile, $rootScope, $httpBackend) ->
        scope = $rootScope
        httpLocalBackend = $httpBackend
        scope.user = {id:1, groupIds:[]}
        scope.groups = groups
        component = $compile('<facility-group-picker user="user" groups="groups"></facility-group-picker>')(scope)
        scope.$digest()
      )
    )

    it("should provide component", ->
      httpLocalBackend.expectGET("/api/manage/facility_groups").response(200, "")
      expect( component.hasClass("facility-group-picker") ).toBe(true)
    )

    it("should add group id to user object when toggle is selected", ->
      httpLocalBackend.expectGET("/api/manage/facility_groups").response(200, "")
      component.find(".pvdm-toggle-switch").eq(0).click()
      expect( scope.user.groupIds[0] ).toBe(1)
    )

  )

)