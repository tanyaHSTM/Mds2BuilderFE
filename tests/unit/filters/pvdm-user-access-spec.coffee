describe("Unit Test => Filters =>", ->

  describe("userAccess =>", ->

    filter = {}
    keys = [
      "users.facility_admin",
      "users.reports",
      "users.stage_1_assessments",
      "users.qa_admin",
      "users.stage_2_investigations",
      "users.corp_admin"
    ]

    beforeEach( ->
      module("pascalprecht.translate")
      module("abaqis.filters")
      module("abaqis.constants")
      inject(
        ($injector) ->
          filter = $injector.get("userAccessFilter")
      )
    )

    it("should return proper translation key for numeric value", ->
      for value,i in [2,3,4,5,6,7]
        text = filter(value)
        expect( text ).toBe( keys[i] )
    )

    it("should return proper translation key for numeric value if passed as string", ->
      for value,i in ["2","3","4","5","6","7"]
        expect( filter(value) ).toBe( keys[i] )
    )

    it("should return '--' for everything else", ->
      for value in ["",9,"9",[],{},->]
        expect( filter(value) ).toEqual( '--' )
    )

  )

)
