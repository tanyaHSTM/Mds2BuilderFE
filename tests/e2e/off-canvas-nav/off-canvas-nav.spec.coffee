LoginPage = require('../login/login.po.coffee')
OffCanvasNav = require('../off-canvas-nav/off-canvas-nav.po.coffee')

describe 'off canvas nav', ->

  describe 'navigation', ->  

    it "should login", ->
      browser.get(baseUrl + loginUrl)
      LoginPage.loginAsAbaqisUser()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + facilitiesUrl)
  
    it "should use ocn to successfully navigate to facilities", ->
      OffCanvasNav.navIcon.click()
      OffCanvasNav.facilitiesLink.click()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + facilitiesUrl)

    it "should use ocn to successfully navigate to users", ->
      OffCanvasNav.navIcon.click()
      OffCanvasNav.usersLink.click()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + usersUrl)

    it "should use ocn to successfully navigate to mds", ->
      OffCanvasNav.navIcon.click()
      OffCanvasNav.mdsLink.click()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + mdsUrl)

    it "should use ocn to successfully navigate to notifications", ->
      OffCanvasNav.navIcon.click()
      OffCanvasNav.notifyBell.click()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + notificationsUrl)
 
    it "should use ocn to successfully logout", ->
     OffCanvasNav.logout()
     expect(successStickie.isPresent()).toBe(true)
     closeStickieButton.click()
     expect(successStickie.isPresent()).toBe(false)

  describe 'change password', ->

    it "should successfully change password", ->
      browser.get(baseUrl + loginUrl)
      LoginPage.loginAsAbaqisUser()

      OffCanvasNav.changePassword(qaPassword, 'foobar1111', 'foobar1111')
      OffCanvasNav.logout()

    it "should successfully change password back", ->
      browser.get(baseUrl + loginUrl)
      LoginPage.loginAsAbaqisUser()

      OffCanvasNav.changePassword('foobar1111', qaPassword, qaPassword)
      OffCanvasNav.logout()