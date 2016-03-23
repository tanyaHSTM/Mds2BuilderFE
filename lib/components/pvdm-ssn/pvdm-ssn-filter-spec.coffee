'use strict'

describe('Unit Test => Filters =>', ->

  describe('pvdmSSN =>', ->

    filter = {}

    beforeEach( ->
      module('pvdmSSN')
      inject(
        ($injector) ->
          filter = $injector.get('ssnFilter')
      )
    )

    it('should add dashes where appropriate', ->
      expect(filter('1')).toEqual('1')
      expect(filter('12')).toEqual('12')
      expect(filter('123')).toEqual('123')
      expect(filter('1234')).toEqual('123-4')
      expect(filter('12345')).toEqual('123-45')
      expect(filter('123456')).toEqual('123-45-6')
      expect(filter('1234567')).toEqual('123-45-67')
      expect(filter('12345678')).toEqual('123-45-678')
      expect(filter('123456789')).toEqual('123-45-6789')
    )

    it('should mask before last dash when mask flag passed and ssn is 9 digits', ->
      expect(filter('1', true)).toEqual('1')
      expect(filter('12', true)).toEqual('12')
      expect(filter('123', true)).toEqual('123')
      expect(filter('1234', true)).toEqual('123-4')
      expect(filter('12345', true)).toEqual('123-45')
      expect(filter('123456', true)).toEqual('123-45-6')
      expect(filter('1234567', true)).toEqual('123-45-67')
      expect(filter('12345678', true)).toEqual('123-45-678')
      expect(filter('123456789', true)).toEqual('***-**-6789')
    )

    it('should return empty string for anything but numeric characters', ->
      expect(filter('')).toEqual('')
      expect(filter('a')).toEqual('')
      expect(filter('.')).toEqual('')
    )

  )

)
