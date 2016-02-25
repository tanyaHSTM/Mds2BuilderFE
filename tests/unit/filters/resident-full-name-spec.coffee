describe("Unit Test => Filters =>", ->

  describe("residentFullName =>", ->

    filter = {}
    residents = [
      {first:"Fred",middle:"P",last:"Flinstone",nickname:"Big Dog"}
      {first:"Barney",middle:null,last:"Rubble",nickname:null}
      {first:"",middle:null,last:"",nickname:null}
      {}
    ]

    beforeEach( ->
      module("abaqis.filters")
      inject(
        ($injector) ->
          filter = $injector.get("residentFullNameFilter")
      )
    )

    it("should format Last, First M. 'Nickname' by default", ->
      expect( filter(residents[0]) ).toEqual( 'Flinstone, Fred P. "Big Dog"' )
    )

    it("should optionally format First 'Nickname' M. Last", ->
      expect( filter(residents[0], true) ).toEqual( 'Fred "Big Dog" P. Flinstone' )
    )

    it("should return '--' for empty resident", ->
      expect( filter(residents[2]) ).toEqual("--")
    )

    it("should return '--' for invalid resident", ->
      expect( filter(residents[3]) ).toEqual("--")
    )

  )

)
