LoginPage = require('./login.po.coffee')
OffCanvasNav = require('../off-canvas-nav/off-canvas-nav.po.coffee')

describe 'login page', ->

  describe 'validation', ->
    
    browser.get(baseUrl + loginUrl)

    beforeEach ->
      browser.refresh()
    
    it "has corret title", ->
      expect(browser.getTitle()).toEqual LoginPage.pageTitle
  
    it "should not be able to access protected urls if not logged in", ->
      browser.get(baseUrl + facilitiesUrl)
      expect(browser.getCurrentUrl()).toEqual(baseUrl + loginUrl)
  
    it "submit button should be disabled upon page load", ->
      expect(LoginPage.loginSubmitButton.isEnabled()).toBe(false)
  
    it "submit button should be disabled if password is blank", ->
      LoginPage.loginField.sendKeys "foobar"
      expect(LoginPage.loginSubmitButton.isEnabled()).toBe(false)
  
    it "submit button should be disabled if login is blank", ->
      LoginPage.passwordField.sendKeys "foobar"
      expect(LoginPage.loginSubmitButton.isEnabled()).toBe(false)
  
    it "login field should have field validation", ->
      LoginPage.loginField.sendKeys ""
      LoginPage.passwordField.sendKeys "foobar"
      expect(LoginPage.loginRequiredError.isPresent()).toBe(true)
  
    it "password field should have field validation", ->
      LoginPage.passwordField.sendKeys ""
      LoginPage.loginField.sendKeys "foobar"
      expect(LoginPage.passwordRequiredError.isPresent()).toBe(true)
  
  describe 'authentication', ->

    beforeEach ->
      browser.refresh()
  
    it "fail login when login is correct but passsword is wrong", ->
      LoginPage.loginField.sendKeys qaLogin
      LoginPage.passwordField.sendKeys "foobar"
      expect(LoginPage.loginSubmitButton.isEnabled()).toBe(true)
      LoginPage.loginSubmitButton.click()
      expect(failStickie.isPresent()).toBe(true)
      closeStickieButton.click()
      expect(failStickie.isPresent()).toBe(false)
      expect(browser.getCurrentUrl()).toEqual(baseUrl + loginUrl)
  
    it "fail login when password is correct but login is wrong", ->
      LoginPage.loginField.sendKeys "foobar"
      LoginPage.passwordField.sendKeys qaPassword
      expect(LoginPage.loginSubmitButton.isEnabled()).toBe(true)
      LoginPage.loginSubmitButton.click()
      expect(failStickie.isPresent()).toBe(true)
      closeStickieButton.click()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + loginUrl)
  
    it "successful login when both name and password are correct", ->
      LoginPage.loginAsAbaqisUser()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + facilitiesUrl)

      OffCanvasNav.logout()

    it "successful login with email address", ->
      LoginPage.loginField.sendKeys qaEmail
      LoginPage.passwordField.sendKeys qaPassword
      LoginPage.loginSubmitButton.click()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + facilitiesUrl)

      OffCanvasNav.logout()