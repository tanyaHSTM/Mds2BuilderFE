describe("Unit Test => Filters =>", ->

  describe("pvdmNaturalList =>", ->

    _ = filter = {}

    beforeEach( ->
      module("abaqis.filters")
      module("abaqis.services")
      inject(
        ($injector) ->
          filter = $injector.get("pvdmNaturalListFilterFilter")
          _ = $injector.get("_")
      )
    )

    it("should return first record when array length === 1", ->
      expect( filter([1]) ).toEqual(1)
    )

    it("should join first and last items in two record array with 'and'", ->
      expect( filter([1,2]) ).toEqual("1 and 2")
    )

    it("should join all but last record with ',' in arrays > 2", ->
      expect( filter([1,2,3]) ).toEqual("1, 2 and 3")
      expect( filter([1,2,3,4]) ).toEqual("1, 2, 3 and 4")
    )

  )

)
