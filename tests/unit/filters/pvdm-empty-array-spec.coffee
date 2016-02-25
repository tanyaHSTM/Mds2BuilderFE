describe("Unit Test => Filters =>", ->

  describe("pvdmEmptyArray =>", ->

    _ = filter = {}
    arr = [
      {id:1, name:"Alf", group_ids:[1,2]}
      {id:2, name:"Bob", group_ids:[]}
      {id:3, name:"Cindy", group_ids:[5,6]}
      {id:4, name:"Dan", group_ids:[7,8]}
      {id:5, name:"Ella", group_ids:[]}
      {id:6, name:"Fred", group_ids:[11,12]}
    ]

    beforeEach( ->
      module("abaqis.filters")
      module("abaqis.services")
      inject(
        ($injector) ->
          filter = $injector.get("pvdmEmptyArrayFilter")
          _ = $injector.get("_")
      )
    )

    it("should return entire collection when 'applyFilter' is false", ->
      filteredArr = filter(arr, "group_ids", false)
      expect( _.isEqual(arr, filteredArr) ).toBe(true)
    )

    it("should return subset of collection where each record's parameter value is an empty array", ->
      filteredArr = _.pluck(filter(arr, "group_ids", true), "id")
      expect( _.isEqual(filteredArr, [2,5]) ).toBe(true)
    )

  )

)
