"use strict"

describe("Unit Test => Services => pvdmCollection =>", ->

  describe("new Collection(records, key, reverse) =>", ->

    Collection = Record = _ = COLLECTION_ERRORS = {}
    data = [
      {id:1, name: "A"}
      {id:2, name: "B"}
      {id:3, name: "C"}
      {id:4, name: "D"}
      {id:5, name: "E"}
    ]

    beforeEach( ->
      module("abaqis.services")
      inject(
        ($injector) ->
          Collection = $injector.get("Collection")
          Record = $injector.get("Record")
          COLLECTION_ERRORS = $injector.get("COLLECTION_ERRORS")
          _ = $injector.get("_")
      )
    )

    it("should contain an empty array if instantiated without data", ->
      collection = new Collection()
      expect( _.isEqual(collection.records,[]) ).toBe(true)
    )

    it("should contain the records it's instantiated with if passed an array", ->
      collection = new Collection( angular.copy(data) )
      expect( _.isEqual(collection.records, data) ).toBe(true)
    )

    describe( "#set(data)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.set).toEqual("function")
      )
      it("should set records", ->
        collection = new Collection()
        collection.set( angular.copy(data) )
        expect( _.isEqual(collection.records, data) ).toBe(true)
      )
    )

    describe( "#clear()", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.clear).toEqual("function")
      )
      it("should clear records", ->
        collection = new Collection( angular.copy(data) )
        collection.clear()
        expect( _.isEqual(collection.records, []) ).toBe(true)
      )
    )

    describe( "#sortBy(key)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.sortBy).toEqual("function")
      )
      it("should sort collection by 'key'", ->
        collection = new Collection( angular.copy(data), "name", true )
        collection.sort()
        expect( _.isEqual(collection.first(), {id:5, name: "E"}) ).toBe(true)
        collection.sortBy('id')
        expect( _.isEqual(collection.first(), {id:1, name: "A"}) ).toBe(true)
      )
      it("should reverse sort if subsequent sortBy(key) uses the same key", ->
        collection = new Collection( angular.copy(data))
        collection.sort()
        collection.sortBy("name")
        collection.sortBy("name")
        expect( _.isEqual(collection.first(), {id:5, name: "E"}) ).toBe(true)
      )
    )

    describe( "#add(record)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.add).toEqual("function")
      )
      it("should add a record", ->
        collection = new Collection()
        newRecord = {id:6, name: "F"}
        collection.add(newRecord)
        expect( _.isEqual(collection.records[0], newRecord) ).toBe(true)
      )
    )

    describe( "#delete(id)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.delete).toEqual("function")
      )
      it("should delete a record", ->
        collection = new Collection( angular.copy(data) )
        collection.delete(1)
        expect( _.contains(collection.records, {id:6, name: "F"}) ).toBe(false)
      )
    )

    describe( "#select(id, referenceArray)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.select).toEqual("function")
      )
      it("sould select a record when passed an id", ->
        collection = new Collection( angular.copy(data) )
        collection.select(1)
        expect(collection.records[0].$selected).toBe(true)
      )
      it("should select multiple records when passed an array of ids", ->
        collection = new Collection( angular.copy(data) )
        collection.select([1,2,3])
        expect(collection.records[0].$selected).toBe(true)
        expect(collection.records[1].$selected).toBe(true)
        expect(collection.records[2].$selected).toBe(true)
      )
      it("should optionally add unique ids to reference array", ->
        referenceArray = [1]
        collection = new Collection( angular.copy(data) )
        collection.select(2, referenceArray)
        expect( _.isEqual(referenceArray, [1,2]) ).toBe(true)
      )
      it("should not add duplicate ids to reference array", ->
        referenceArray = [1]
        collection = new Collection( angular.copy(data) )
        collection.select([1,2], referenceArray)
        expect( _.isEqual(referenceArray, [1,2]) ).toBe(true)
      )
    )

    describe( "#selectAll(referenceArray)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.selectAll).toEqual("function")
      )
      it("should set all records $selected to TRUE", ->
        collection = new Collection( angular.copy(data) )
        collection.selectAll()
        expect( _.where(collection.records, {$selected:true}).length ).toEqual(5)
      )
      it("should optionally add unique ids to reference array", ->
        collection = new Collection( angular.copy(data) )
        referenceArray = [1,3]
        collection.selectAll(referenceArray)
        referenceArray.sort( (a, b) -> a-b )
        expect( _.isEqual(referenceArray, [1,2,3,4,5]) ).toBe(true)
      )
    )

    describe( "#deselectAll(referenceArray)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.deselectAll).toEqual("function")
      )
      it("should set all records $selected to FALSE", ->
        collection = new Collection( angular.copy(data) )
        collection.selectAll()
        collection.deselectAll()
        expect( _.where(collection.records, {$selected:false}).length ).toEqual(5)
      )
      it("should optionally remove all ids from reference array", ->
        collection = new Collection( angular.copy(data) )
        referenceArray = [1,2,3,4,5,6,7]
        collection.deselectAll(referenceArray)
        expect( referenceArray.length ).toEqual(0)
      )
    )

    describe( "#each(callback)", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.each).toEqual("function")
      )
      it("should instatiate each item in collection as instance of 'Record'", ->
        collection = new Collection( angular.copy(data) )
        arr = []
        collection.each( (record, index) ->
          expect( record.constructor.name ).toEqual('Record')
          arr.push(index)
        )
      )
    )

    describe( "#first()", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.first).toEqual("function")
      )
      it("should return first record in collection", ->
        collection = new Collection( angular.copy(data) )
        expect( _.isEqual(collection.first(), {id:1, name: "A"}) ).toBe(true)
      )
    )

    describe( "#last()", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.last).toEqual("function")
      )
      it("should return last record in collection", ->
        collection = new Collection( angular.copy(data) )
        expect( _.isEqual(collection.last(), {id:5, name: "E"}) ).toBe(true)
      )
    )

    describe( "#copy()", ->
      it("should be defined", ->
        expect(typeof Collection.prototype.copy).toEqual("function")
      )
      it("should create unreferenced copy of original collection", ->
        collection_1 = new Collection( angular.copy(data) )
        collection_2 = new Collection( collection_1.copy() )
        expect( _.isEqual(collection_1.records, collection_2.records) ).toBe(true)
        collection_2.select(1)
        expect( _.isEqual(collection_1.records, collection_2.records) ).toBe(false)
      )
    )

  )

)
