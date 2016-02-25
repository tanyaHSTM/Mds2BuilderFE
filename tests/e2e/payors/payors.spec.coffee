LoginPage = require('../login/login.po.coffee')
OffCanvasNav = require('../off-canvas-nav/off-canvas-nav.po.coffee')
Facilities = require('../facilities/facilities.po.coffee')
Payors = require('./payors.po.coffee')

describe 'crud payors', ->

  describe 'new action', ->
    
    it "should navigate to payors", ->
      browser.get(baseUrl + loginUrl)
      LoginPage.loginAsAbaqisUser()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + facilitiesUrl)

      Facilities.facilitiesList.get(0).click()
      Facilities.payorsTab.click()

    it "name field is required", ->
      Payors.createPayor({ category: 'Private Pay', name: " ", with_errors: true })
      expect(Payors.nameRequiredError.isPresent()).toBe(true)
      expect(Payors.newPayorSaveButton.isEnabled()).toBe(false)

      Payors.newPayorCancelButton.click()

    it "name must be at least two chars long", ->
      Payors.createPayor({ category: 'Private Pay', name: "f", with_errors: true })
      expect(Payors.nameTooShortError.isPresent()).toBe(true)
      expect(Payors.newPayorSaveButton.isEnabled()).toBe(false)

      Payors.newPayorCancelButton.click()

    it "name must be unique", ->
      Payors.createPayor({ category: 'Private Pay', name: "1foobar"})
      Payors.createPayor({ category: 'Private Pay', name: "1fooba", with_errors: true })
      Payors.payorNameField.sendKeys 'r'
      expect(Payors.nameUniqueError.isPresent()).toBe(true)
      expect(Payors.newPayorSaveButton.isEnabled()).toBe(false)

      Payors.newPayorCancelButton.click()
      Payors.deletePayor()

    it "should be unique even with different category", ->
      Payors.createPayor({ category: 'Private Pay', name: "1foobar" })
      Payors.createPayor({ category: 'Medicaid', name: "1fooba", with_errors: true })
      Payors.payorNameField.sendKeys 'r'
      expect(Payors.nameUniqueError.isPresent()).toBe(true)
      expect(Payors.newPayorSaveButton.isEnabled()).toBe(false)

      Payors.newPayorCancelButton.click()
      Payors.deletePayor()

  describe 'edit action', ->

    it "name field is required", ->
      Payors.createPayor({ category: 'Private Pay', name: "1foobar" })
      Payors.editPayor({ name: " ", with_errors: true })
      expect(Payors.nameRequiredError.isPresent()).toBe(true)
      expect(Payors.editPayorSaveButton.isEnabled()).toBe(false)

      Payors.editPayorCancelButton.click()
      Payors.deletePayor()

    it "name must be at least two chars long", ->
      Payors.createPayor({ category: 'Private Pay', name: "1foobar" })
      Payors.editPayor({ name: "f", with_errors: true })
      expect(Payors.nameTooShortError.isPresent()).toBe(true)
      expect(Payors.editPayorSaveButton.isEnabled()).toBe(false)

      Payors.editPayorCancelButton.click()
      Payors.deletePayor()

    it "name must be unique", ->
      Payors.createPayor({ category: 'Private Pay', name: "1foobar"})
      Payors.createPayor({ category: 'Medicaid', name: "1fooba"})
      Payors.editPayor({ name: "1fooba", with_errors: true })
      Payors.payorNameField.sendKeys 'r'
      expect(Payors.nameUniqueError.isPresent()).toBe(true)
      expect(Payors.editPayorSaveButton.isEnabled()).toBe(false)

      Payors.editPayorCancelButton.click()
      Payors.deletePayor()
      Payors.deletePayor()

  describe 'delete action', ->

    it "should cancel confirm delete modal", ->
      Payors.createPayor({ category: 'Private Pay', name: "1foobar" })
      expect(Payors.editPayorLink.isPresent()).toBe(true)
      Payors.editPayorLink.click()
      Payors.payorDeleteButton.click()
      Payors.payorDeleteCancelButton.click()

      Payors.deletePayor()

    it "should delete partner", ->
      Payors.createPayor({ category: 'Private Pay', name: "1foobar" })
      Payors.deletePayor()

      OffCanvasNav.logout()