'use strict'

describe('Unit Test => Components =>', ->

  describe('pvdmMessages =>', ->

    scope = component = {}
    msgs = undefined
    beforeEach( ->
      module('pvdm.components')
      module('pvdm.messages')
      module('mockTemplates')
      inject( ($injector, $compile, $rootScope, messages) ->
        scope = $rootScope
        msgs = messages
        component = $compile("<pvdm-messages></pvdm-messages>")(scope)
        scope.$digest()
      )
    )

    it('should display a message when success message added for the current route', ->
      scope.$apply( ->
        msgs.forCurrentRoute("Test messages 2", "success")
      )
      expect( component.text()).toContain('Test messages 2')
      expect( component.html()).toContain('alert-success-icon')
    )

    it('should display a message when warning message added for the current route ', ->
      scope.$apply( ->
        msgs.forCurrentRoute("The user was not deleted", "warning")
      )
      expect( component.text()).toContain('The user was not deleted')
      expect( component.html()).toContain('alert-warning-icon')
    )

    it('should display a message when danger message added for the current route ', ->
      scope.$apply( ->
        msgs.forCurrentRoute("The snapshot was deleted", "danger")
      )
      expect( component.text()).toContain('The snapshot was deleted')
      expect( component.html()).toContain('alert-danger-icon')
    )

    it('should display a message when info message added for the current route ', ->
      scope.$apply( ->
        msgs.forCurrentRoute("You have been logged out", "info")
      )
      expect( component.text()).toContain('You have been logged out')
      expect( component.html()).toContain('alert-info-icon')
    )

    it('should not display a message when a invalid type is specified', ->
      scope.$apply( ->
        msgs.forCurrentRoute("this message should not be displayed", "error")
      )
      expect( component.text()).not.toContain('this message should not be displayed')
      expect( component.html()).not.toContain('alert-success-icon')
    )


  )
)
