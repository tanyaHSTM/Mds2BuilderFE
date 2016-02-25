describe("Unit Test => Filters =>", ->

  describe("facilityPartnerType =>", ->

    filter = {}
    keys = [
      "health_care_partners.hospital",
      "health_care_partners.assisted_living",
      "health_care_partners.hospice",
      "health_care_partners.senior_housing",
      "health_care_partners.home_care_agency"
    ]

    beforeEach( ->
      module("abaqis.filters")
      module("abaqis.constants")
      inject(
        ($injector) ->
          filter = $injector.get("facilityPartnerTypeFilter")
      )
    )

    it("should return proper translation key for numeric value", ->
      for value in [1..5]
        expect( filter(value) ).toBe( keys[value-1] )
    )

    it("should return proper translation key for numeric value if passed as string", ->
      for value in ["1","2","3","4","5"]
        expect( filter(value) ).toBe( keys[parseInt(value)-1] )
    )

    it("should return '--' for everything else", ->
      for value in ["",6,"6",[],{},->]
        expect( filter(value) ).toEqual( '--' )
    )

  )

)
