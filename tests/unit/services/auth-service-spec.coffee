"use strict"

describe("Unit Test => Services => AuthService =>", ->

  AuthService = SessionFactory = Idle = $httpBackend = _ = {}
  user =
    "id": "5539b76e52fb182eb949463f"
    "email": "jsmith@example.com"
    "login": "john"
    "permission_ids": [2,3,4]
    "facility_ids": [1,2,3,4,5]
  credentials =
    email: "foo@bar.com"
    password: "password"

  beforeEach( ->
    module("ui.bootstrap")
    module("ui.router")
    module("pascalprecht.translate")
    module("ngIdle")
    module("angular-locker")
    module("pvdmNotifications")
    module("abaqis.constants")
    module("abaqis.services")
    module("abaqis.auth")
    module("abaqis.session")
    inject(
      ($injector) ->
        SessionFactory = $injector.get("SessionFactory")
        AuthService = $injector.get("AuthService")
        Idle = $injector.get("Idle")
        $httpBackend = $injector.get("$httpBackend")
        _ = $injector.get("_")
    )
  )

  describe( "#login(credentials)", ->
    it("should be defined", ->
      expect(typeof AuthService.login).toEqual("function")
    )
    beforeEach( ->
      $httpBackend.when("POST", "/api/login").respond(200, user)
      SessionFactory.destroy()
    )
    it("should cache valid session on successful login", (done) ->
      AuthService.login(credentials)
        .then( (user) ->
          expect(SessionFactory.valid).toBe(true)
        )
        .catch( (error) ->
          expect(error).toBeUndefined()
        )
        .finally(done)
      $httpBackend.flush()
    )
    it("should start idle service", (done) ->
      AuthService.login(credentials)
        .then( (user)->
          expect(Idle.running()).toBe(true)
        )
        .catch( (error) ->
          expect(error).toBeUndefined()
        )
        .finally(done)
      $httpBackend.flush()
    )
  )

  describe( "#logout()", ->
    it("should be defined", ->
      expect(typeof AuthService.logout).toEqual("function")
    )
    beforeEach( ->
      $httpBackend.when("GET", "/api/logout").respond(200)
      SessionFactory.create(user)
      Idle.watch()
    )
    it("should clear session on successful logout", (done) ->
      AuthService.logout()
        .then( ->
          expect(SessionFactory.valid).toBe(false)
        )
        .catch( (error) ->
          expect(error).toBeUndefined()
        )
        .finally(done)
      $httpBackend.flush()
    )
    it("should stop idle service", (done) ->
      AuthService.logout()
        .then( ->
          expect(Idle.running()).toBe(false)
        )
        .catch( (error) ->
          expect(error).toBeUndefined()
        )
        .finally(done)
      $httpBackend.flush()
    )
  )

  describe( "#authorized(permissions)", ->
    afterAll( ->
      SessionFactory.destroy()
    )
    it("should be defined", ->
      expect(typeof AuthService.authorized).toEqual("function")
    )
    it("should return FALSE if session !valid", ->
      expect(AuthService.authorized(1)).toBe(false)
    )
    it("should return TRUE if session valid and user has given permission", ->
      SessionFactory.create(user)
      expect(AuthService.authorized(4)).toBe(true)
      expect(AuthService.authorized([4,5,6])).toBe(true)
    )
  )

)
