"use strict"

describe("Unit Test => Services => pvdmRecord =>", ->

  describe("new Record(record) =>", ->

    Record = record = _ = RECORD_ERRORS = {}

    beforeEach( ->
      module("abaqis.services")
      inject(
        ($injector) ->
          Record = $injector.get("Record")
          RECORD_ERRORS = $injector.get("RECORD_ERRORS")
          _ = $injector.get("_")
      )
    )

    it("should return an object if instantiated without data", ->
      record = new Record()
      expect( _.keys(record)[0] ).toEqual("$selected")
    )

    it("should throw an error if instantiated with wrong data type for 'record'", ->
      error = new Error(RECORD_ERRORS.RECORD_INVALID)
      for type in ["a",[],1,->]
        expect( -> new Record(type) ).toThrow( error )
    )

    it("should set $selected to false by default", ->
      record = new Record(id: 1)
      expect(record.$selected).toEqual(false)
    )

    describe( "#select()", ->
      it("should be defined", ->
        expect(typeof Record.prototype.select).toEqual("function")
      )
      it("should set $selected to true", ->
        record = new Record(id: 1)
        record.select()
        expect(record.$selected).toEqual(true)
      )
    )

    describe( "#deselect()", ->
      it("should be defined", ->
        expect(typeof Record.prototype.deselect).toEqual("function")
      )
      it("should set $selected to false", ->
        record = new Record(id: 1)
        record.select()
        expect(record.$selected).toEqual(true)
        record.deselect()
        expect(record.$selected).toEqual(false)
      )
    )

    describe( "#setSelected(id, selected)", ->
      it("should be defined", ->
        expect(typeof Record.prototype.setSelected).toEqual("function")
      )
      it("should thrown an error if provided wrong data type for 'id'", ->
        error = new Error(RECORD_ERRORS.SET_SELECTED.ID_INVALID)
        record = new Record()
        for type in [null,"a",[],{},->]
          expect( -> record.setSelected(type, true) ).toThrow( error )
      )
      it("should thrown an error if provided wrong data type for 'selected'", ->
        error = new Error(RECORD_ERRORS.SET_SELECTED.SELECTED_INVALID)
        record = new Record()
        for type in [null,"a",[],{},->]
          expect( -> record.setSelected(1, type) ).toThrow( error )
      )
      it("should set $selected to 'selected' if matched on 'id'", ->
        record = new Record(id: 1)
        record.setSelected(1, true)
        expect(record.$selected).toEqual(true)
        record.setSelected(1, false)
        expect(record.$selected).toEqual(false)
      )
      it("should NOT set $selected to 'selected' if NOT matched on 'id'", ->
        record = new Record(id: 1)
        record.setSelected(2, true)
        expect(record.$selected).toEqual(false)
      )
      it("should return TRUE if it selects record", ->
        record = new Record(id: 1)
        expect(record.setSelected(1, true)).toEqual(true)
      )
      it("should return FALSE if it deselects record", ->
        record = new Record(id: 1)
        expect(record.setSelected(1, false)).toEqual(false)
      )
      it("should return FALSE if 'id' doesn't match", ->
        record = new Record(id: 2)
        expect(record.setSelected(1, false)).toEqual(false)
      )
    )

  )

)
