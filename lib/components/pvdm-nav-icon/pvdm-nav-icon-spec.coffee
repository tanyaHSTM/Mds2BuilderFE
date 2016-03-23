  'use strict'

  describe('Unit Test => Components =>', ->

    describe('pvdmNavIcon =>', ->

      scope = component = nav = {}
      sessionData =
        'current_user':
          'id':1

      beforeEach( ->
        module('pvdm.services')
        module('pvdm.session')
        module('pvdm.components')
        module('mockTemplates')
        inject( ($rootScope, $compile, offCanvasNav, SessionFactory) ->
          scope = $rootScope
          nav = offCanvasNav
          component = $compile('<pvdm-nav-icon></pvdm-nav-icon>')(scope)
          SessionFactory.create(sessionData)
        )
      )

      it('should provide icon component', ->
        scope.$digest()
        expect( component.find('.pvdm-nav-icon').length ).toBe(1)
        expect( component.find('span.line').length ).toEqual(3)
      )

      it('should be "active" if offCanvasNav.active is TRUE', ->
        nav.activate()
        scope.$digest()
        expect( component.find('.pvdm-nav-icon').hasClass('active') ).toBe(true)
      )

      it('should not be "active" if offCanvasNav.active is FALSE', ->
        nav.deactivate()
        scope.$digest()
        expect( component.find('.pvdm-nav-icon').hasClass('active') ).toBe(false)
      )

    )
  )
