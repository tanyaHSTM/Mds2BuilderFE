"use strict"

describe("Unit Test => Services =>", ->

  describe("pvdmUnique =>", ->

    $compile = $rootScope = $httpBackend = dupRequestHandler = {}

    beforeEach( ->
      module("abaqis.directives")
      inject(
        ($injector) ->
          $compile = $injector.get("$compile")
          $rootScope = $injector.get("$rootScope")
          $httpBackend = $injector.get("$httpBackend")
      )
    )

    it("should throw an exception if no api end point is specified", ->
      error = new Error("Missing api end point; use 'api' to define the end point")
      fakeDom =
        '''
        <form name="form">
          <input
            name="input"
            ng-model="model"
            pvdm-unique="/validation/path">
        </form>
        '''
      expect( -> $compile(fakeDom)($rootScope) ).toThrow(error)
    )

    it("should invalidate the form if value is a duplicate", ->
      fakeDom =
        """
        <form name='form'>
          <input
            name='input'
            ng-model='model'
            pvdm-unique='param'
            api='/validation/path'>
        </form>
        """
      $compile(fakeDom)($rootScope)
      $rootScope.model = "duplicate_value"

      $httpBackend.when("GET", "/validation/path?param=duplicate_value").respond(409,"")
      $httpBackend.flush()

      $rootScope.$digest()

      expect($rootScope.form.$invalid).toBe(true)
      expect($rootScope.form.input.$error.unique).not.toBe(false)
    )

    it("should not invalidate the form if value is unique", ->
      fakeDom =
        """
        <form name='form'>
          <input
            name='input'
            ng-model='model'
            pvdm-unique='param'
            api='/validation/path'>
        </form>
        """
      $compile(fakeDom)($rootScope)
      $rootScope.model = "unique_value"

      $httpBackend.when("GET", "/validation/path?param=unique_value").respond(200,"")
      $httpBackend.flush()

      $rootScope.$digest()

      expect($rootScope.form.$invalid).toBe(false)
      expect($rootScope.form.input.$error.unique).not.toBe(true)
    )

  )

)
