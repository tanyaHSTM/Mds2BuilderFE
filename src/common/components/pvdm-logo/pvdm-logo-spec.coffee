'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmLogo =>', ->

    scope = component = {}

    beforeEach( ->
      module('pvdm.session')
      module('pvdm.components')
      module('mockTemplates')
      inject( ($injector, $compile, $rootScope) ->
        scope = $rootScope
        component = $compile('<pvdm-logo></pvdm-logo>')(scope)
      )
    )

    it('should provide logo component', ->
      scope.$digest()
      expect( component.find('.pvdm-logo').size() ).toBe(1)
    )

  )
)
