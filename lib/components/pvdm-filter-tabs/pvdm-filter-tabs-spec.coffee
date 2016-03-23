'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmFilterTabs =>', ->

    scope = component = {}

    beforeEach( ->
      module('mockTemplates')
      module('pascalprecht.translate')
      module('pvdm.components')
      module('pvdm.services')
      inject( ($rootScope, $compile, FilterParameters) ->
        scope = $rootScope
        scope.filterManager = new FilterParameters()
        component = $compile('<pvdm-filter-tabs filter-manager="filterManager"></pvdm-filter-tabs>')(scope)
        scope.$digest()
      )
    )

    it('should provide component', ->
      expect( component.find('.pvdm-filter-tabs').length ).toBe(1)
    )

    it('should show tab for filter manager entries', ->
      scope.filterManager.set('test','test','test')
      scope.$digest()
      expect( component.find('.pvdm-filter-tab').length ).toBe(1)
    )

  )
)
