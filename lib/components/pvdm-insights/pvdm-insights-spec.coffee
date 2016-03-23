'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmInsights =>', ->

    scope = component = {}

    beforeEach( ->
      module('pvdm.components')
      module('pascalprecht.translate')
      module('mockTemplates')
      module('pvdm.services')

      inject( ($injector, $compile, $rootScope, FilterParameters, Collection) ->
        scope = $rootScope
        scope.collection = new Collection()
        scope.filter = new FilterParameters()
        scope.insights = [{
          type: "warning",
          param: "recentlyAdmitted",
          count: 2,
          label: "One"
        },{
          type: "danger",
          param: "recentlyDischarged",
          count: 5,
          label: "Two"
        }]
        component = $compile('<pvdm-insights 
                                collection="collection"
                                insights="insights">
                              </pvdm-insights>')(scope)
        scope.$digest()
      )
    )

    it('should provide component', ->
      expect( component.find('.pvdm-insights').length ).toBe(1)
    )

    it('should set insight labels', ->
      expect( component.text()).toContain('One')
      expect( component.text()).toContain('Two')
    )

    it('should include correct insight type', ->
      expect( component.html()).toContain('insight-danger')
    )

  )
)
