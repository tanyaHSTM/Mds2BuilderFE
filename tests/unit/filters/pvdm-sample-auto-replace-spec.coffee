describe("Unit Test => Filters =>", ->

  describe("sampleAutoReplace =>", ->

    filter = {}
    keys = [
      "random_samples.on",
      "random_samples.off"
    ]

    beforeEach( ->
      module("abaqis.filters")
      module("abaqis.constants")
      inject(
        ($injector) ->
          filter = $injector.get("sampleAutoReplaceFilter")
      )
    )

    it("should return proper translation key for numeric value", ->
      for value,i in [1,0]
        expect( filter(value) ).toBe( keys[i] )
    )

    it("should return proper translation key for boolean value", ->
      for value,i in [true,false]
        expect( filter(value) ).toBe( keys[i] )
    )

    it("should return proper translation key for numeric value if passed as string", ->
      for value,i in ["1","0"]
        expect( filter(value) ).toBe( keys[i] )
    )

    it("should return '--' for everything else", ->
      for value in ["",3,"3",[],{},->]
        expect( filter(value) ).toEqual( '--' )
    )

  )

)
