"use strict"

describe("Unit Test => Services => FilterParametersManager =>", ->

  FilterManager = _ = {}

  beforeEach( ->
    module("pascalprecht.translate")
    module("abaqis.components")
    module("abaqis.services")
    inject(
      ($injector) ->
        FilterManager = $injector.get("FilterParametersManager")
        _ = $injector.get("_")
    )
  )

  describe( "#set(param, value, label)", ->
    it("should be defined", ->
      expect(typeof FilterManager.prototype.set).toEqual("function")
    )
    it("should set label and value on parameter", ->
      filter = new FilterManager()
      expect( _.isEqual(filter.params, {})).toBe(true)
      filter.set("foo","foo","Foo Label")
      expect( _.isEqual(filter.params.foo, {label:"Foo Label", value:"foo"})).toBe(true)
    )
  )

  describe( "#clear()", ->
    it("should be defined", ->
      expect(typeof FilterManager.prototype.clear).toEqual("function")
    )
    it("should clear label and value on parameter", ->
      filter = new FilterManager()
      filter.set("foo","foo","Foo Label")
      expect( _.isEqual(filter.params.foo, {label:"Foo Label", value:"foo"})).toBe(true)
      filter.clear("foo")
      expect( _.isEqual(filter.params, {foo:{label:"", value:""}})).toBe(true)
    )
  )

  describe( "#reset()", ->
    it("should be defined", ->
      expect(typeof FilterManager.prototype.reset).toEqual("function")
    )
    it("should clear label and value on parameter", ->
      filter = new FilterManager()
      filter.set("foo","foo","Foo Label")
      filter.set("bar","bar","Bar Label")
      expect( _.isEqual(filter.params.foo, {label:"Foo Label", value:"foo"})).toBe(true)
      expect( _.isEqual(filter.params.bar, {label:"Bar Label", value:"bar"})).toBe(true)
      filter.reset()
      expect( _.isEqual(filter.params, {foo:{label:"", value:""},bar:{label:"", value:""}})).toBe(true)
    )
  )

)
