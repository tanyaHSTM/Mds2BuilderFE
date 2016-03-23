'use strict'

describe('Unit Test => Services => pvdmCollection =>', ->

  describe('new Collection(records) =>', ->

    Collection = _ = {}
    data = [
      {id:5, name: 'A'}
      {id:4, name: 'B'}
      {id:3, name: 'C'}
      {id:2, name: 'D'}
      {id:1, name: 'E'}
    ]

    beforeEach( ->
      module('pvdm.services')
      inject(
        ($injector) ->
          Collection = $injector.get('Collection')
          _ = $injector.get('_')
      )
    )

    it('should contain an empty array if instantiated without data', ->
      collection = new Collection()
      expect( _.isEqual(collection.records,[]) ).toBe(true)
    )

    it('should contain the records it\'s instantiated with if passed an array', ->
      collection = new Collection( angular.copy(data) )
      expect( _.isEqual(collection.records, data) ).toBe(true)
    )

    describe( '#sortBy(key)', ->
      it('should be defined', ->
        expect(typeof Collection.prototype.sortBy).toEqual('function')
      )
      it('should sort collection by "key"', ->
        collection = new Collection(angular.copy(data)).sortBy('name')
        expect( _.isEqual(collection.records[0], {id:5, name: 'A'}) ).toBe(true)
        collection.sortBy('id')
        expect( _.isEqual(collection.records[0], {id:1, name: 'E'}) ).toBe(true)
      )
    )

    describe( '#add(record)', ->
      it('should be defined', ->
        expect(typeof Collection.prototype.add).toEqual('function')
      )
      it('should add a record', ->
        collection = new Collection()
        newRecord = {id:6, name: 'F'}
        collection.add(newRecord)
        expect( _.isEqual(collection.records[0], newRecord) ).toBe(true)
      )
    )

    describe( '#remove(record)', ->
      it('should be defined', ->
        expect(typeof Collection.prototype.remove).toEqual('function')
      )
      it('should delete a record', ->
        collection = new Collection( angular.copy(data) )
        collection.remove({id:1, name: 'E'})
        expect(
          collection.records.filter( (record) ->
            record.id is 1
          ).length
        ).toBe(0)
      )
    )

    describe( '#selectAll(referenceArray)', ->
      it('should be defined', ->
        expect(typeof Collection.prototype.selectAll).toEqual('function')
      )
      it('should set all records $selected to TRUE', ->
        collection = new Collection( angular.copy(data) )
        collection.selectAll()
        expect(collection.selected.records.length).toEqual(5)
      )
    )

    describe( '#deselectAll(referenceArray)', ->
      it('should be defined', ->
        expect(typeof Collection.prototype.deselectAll).toEqual('function')
      )
      it('should set all records $selected to FALSE', ->
        collection = new Collection( angular.copy(data) )
        collection.selectAll()
        collection.deselectAll()
        expect(collection.selected.records.length).toEqual(0)
      )
    )

  )

)
