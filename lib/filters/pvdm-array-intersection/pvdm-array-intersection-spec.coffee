describe('Unit Test => Filters =>', ->

  describe('pvdmArrayIntersection =>', ->

    _ = filter = {}
    users = [
      {id:1, name:'Alf', group_ids:[1,2]}
      {id:2, name:'Bob', group_ids:[3,4]}
      {id:3, name:'Cindy', group_ids:[5,6]}
      {id:4, name:'Dan', group_ids:[7,8]}
      {id:5, name:'Ella', group_ids:[9,10]}
      {id:6, name:'Fred', group_ids:[11,12]}
    ]

    beforeEach( ->
      module('pvdm.filters')
      module('pvdm.services')
      inject(
        ($injector) ->
          filter = $injector.get('pvdmArrayIntersectionFilter')
          _ = $injector.get('_')
      )
    )

    it('should return subset of collection with matching values', ->
      group_ids = [1,6,8]
      users_in_groups = filter(users, 'group_ids', group_ids)
      matches = users_in_groups.map( (user) ->
        user.name
      )
      expect( _.isEqual(matches, ['Alf','Cindy','Dan']) ).toBe(true)
    )

  )

)
