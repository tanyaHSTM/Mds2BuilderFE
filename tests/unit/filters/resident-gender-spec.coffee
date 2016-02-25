describe("Unit Test => Filters =>", ->

  describe("residentGender =>", ->

    filter = {}
    keys = [
      "residents.male",
      "residents.female"
    ]

    beforeEach( ->
      module("pascalprecht.translate")
      module("abaqis.filters")
      module("abaqis.constants")
      inject(
        ($injector) ->
          filter = $injector.get("residentGenderFilter")
      )
    )

    it("should return proper translation key for numeric value", ->
      for value in [1,2]
        expect( filter(value) ).toBe( keys[value-1] )
    )

    it("should return proper translation key for numeric value if passed as string", ->
      for value in ["1","2"]
        expect( filter(value) ).toBe( keys[parseInt(value)-1] )
    )

    it("should return '--' for everything else", ->
      for value in ["",3,"3",[],{},->]
        expect( filter(value) ).toEqual( '--' )
    )

  )

)
