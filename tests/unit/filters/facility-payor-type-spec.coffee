describe("Unit Test => Filters =>", ->

  describe("facilityPayorType =>", ->

    filter = {}
    keys = [
      "payors.fee_for_service",
      "payors.managed_care_org",
      "payors.medicaid",
      "payors.private_pay",
      "payors.unknown",
      "payors.other"
    ]

    beforeEach( ->
      module("abaqis.filters")
      module("abaqis.constants")
      inject(
        ($injector) ->
          filter = $injector.get("facilityPayorTypeFilter")
      )
    )

    it("should return proper translation key for numeric value", ->
      for value in [1..5]
        expect( filter(value) ).toBe( keys[value-1] )
    )

    it("should return proper translation key for numeric value if passed as string", ->
      for value in ["1","2","3","4","5","6"]
        expect( filter(value) ).toBe( keys[parseInt(value)-1] )
    )

    it("should return '--' for everything else", ->
      for value in ["",7,"7",[],{},->]
        expect( filter(value) ).toEqual( '--' )
    )

  )

)
