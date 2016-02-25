describe("Unit Test => Filters =>", ->

  describe("pvdmCollectionContains =>", ->

    users = []
    _ = filter = {}

    beforeEach( ->
      module("abaqis.filters")
      module("abaqis.services")
      users = [
        {id:1, name:"Alf", group_ids:[1,2]}
        {id:2, name:"Bob", group_ids:[3,4]}
        {id:3, name:"Cindy", group_ids:[5,6]}
        {id:4, name:"Dan", group_ids:[7,8]}
        {id:5, name:"Ella", group_ids:[9,10]}
        {id:6, name:"Fred", group_ids:[11,12]}
      ]
      inject(
        ($injector) ->
          filter = $injector.get("pvdmCollectionContainsFilter")
          _ = $injector.get("_")
      )
    )

    it("should return subset of collection where value (needle) exists in each record's array parameter (haystack)", ->
      users_in_group_1 = filter(users, 1, "group_ids")
      expect( _.isEqual(users_in_group_1[0], users[0]) ).toBe(true)
    )

    it("should return subset of collection where record's parameter (needle) value is contained in reference array (haystack)", ->
      users_with_ids_1_and_3 = filter(users, 'id', [1,3])
      expect( _.isEqual(users_with_ids_1_and_3, [users[0],users[2]]) ).toBe(true)
    )

  )

)
