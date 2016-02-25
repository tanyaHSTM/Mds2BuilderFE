"use strict"

describe("Unit Test => Components =>", ->

  describe("facilityPicker =>", ->

    component = scope = timeout = httpBackend = _ = null
    facilities = [
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
      module("abaqis.manage.facilities")
      module("abaqis.manage.residents")
      inject( ($compile, $rootScope, User, $httpBackend, $timeout) ->
        timeout = $timeout
        httpBackend = $httpBackend
        $httpBackend.when("GET", "/api/manage/facilities").respond(200, facilities)
        scope = $rootScope
        scope.user = new User()
        component = angular.element('<facility-picker user="user"></facility-picker>')
        $compile(component)(scope)
        scope.$digest()
      )
    )

    it("should provide component", ->
      expect( component.hasClass("facility-picker") ).toBe(true)
    )

    it("should add facility id to user object when toggle is selected", ->
      timeout( ->
        component.find(".pvdm-toggle-switch").eq(0).click()
        expect( _.isEqual(scope.user.facilityIds, [1]) ).toBe(true)
      )
    )

  )

)