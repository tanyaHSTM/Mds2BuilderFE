"use strict"

describe("Unit Test => Services => SessionFactory =>", ->

  SessionFactory = SESSION_TPL = _ = {}
  session =
    "valid":true
    "created":"2015-07-28T23:42:19.504Z"
    "user":
      "id":"5539b76e52fb182eb949463f"
      "email":"jsmith@example.com"
      "login":"john"
      "permission_ids": [2,3,4,5,6,7]
      "facility_ids": [1,2,3,4,5]
  user_tpl =
    "id": null
    "email": null
    "login": null
    "permission_ids": []
    "facility_ids": []

  beforeEach( ->
    module("abaqis.services")
    module("abaqis.session")
    inject(
      ($injector) ->
        SessionFactory = $injector.get("SessionFactory")
        SESSION_TPL = $injector.get("SESSION_TPL")
        _ = $injector.get("_")
    )
  )

  it("should initialize with empty session", ->
    expect(SessionFactory.valid).toEqual(false)
    expect(SessionFactory.created).toEqual(null)
    expect(_.isEqual(SessionFactory.user, user_tpl)).toBe(true)
  )

  describe( "#create(data)", ->
    afterAll( ->
      SessionFactory.destroy()
    )
    it("should be defined", ->
      expect(typeof SessionFactory.create).toEqual("function")
    )
    it("should store session data passed to it", ->
      SessionFactory.create(session.user)
      expect(SessionFactory.valid).toBe(true)
      expect(_.isEqual(SessionFactory.user, session.user)).toBe(true)
    )
  )

  describe( "#destroy()", ->
    beforeAll( ->
      SessionFactory.create(session.user)
    )
    it("should be defined", ->
      expect(typeof SessionFactory.destroy).toEqual("function")
    )
    it("should return to empty session", ->
      SessionFactory.destroy()
      expect(SessionFactory.created).toEqual(null)
      expect(_.isEqual(SessionFactory.user, user_tpl)).toBe(true)
    )
  )

)
