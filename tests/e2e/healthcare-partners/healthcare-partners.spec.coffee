LoginPage = require('../login/login.po.coffee')
OffCanvasNav = require('../off-canvas-nav/off-canvas-nav.po.coffee')
Facilities = require('../facilities/facilities.po.coffee')
HealthcarePartners = require('./healthcare-partners.po.coffee')

describe 'crud healthcare partners', ->

  describe 'new action', ->
    
    it "should navigate to healthcare partners", ->
      browser.get(baseUrl + loginUrl)
      LoginPage.loginAsAbaqisUser()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + facilitiesUrl)

      Facilities.facilitiesList.get(0).click()
      Facilities.healthCarePartnersTab.click()

    it "must choose category before name and note fields are enabled", ->
      HealthcarePartners.addNewPartnerButton.click()
      expect(HealthcarePartners.partnerNameField.isEnabled()).toBe(false)
      expect(HealthcarePartners.partnerNoteField.isEnabled()).toBe(false)
      expect(HealthcarePartners.newPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.newPartnerCancelButton.click()

    it "name and note fields are enabled after category is selected", ->
      expect(HealthcarePartners.addNewPartnerButton.isPresent()).toBe(true)
      HealthcarePartners.addNewPartnerButton.click()
      HealthcarePartners.partnerCatergorySelect.click()
      element(By.cssContainingText('option', "Hospice")).click()
      expect(HealthcarePartners.partnerNameField.isEnabled()).toBe(true)
      expect(HealthcarePartners.partnerNoteField.isEnabled()).toBe(true)
      expect(HealthcarePartners.newPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.newPartnerCancelButton.click()

    it "name field is required", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: " ", with_errors: true })
      expect(HealthcarePartners.nameRequiredError.isPresent()).toBe(true)
      expect(HealthcarePartners.newPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.newPartnerCancelButton.click()

    it "name must be at least two chars long", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "f", with_errors: true })
      expect(HealthcarePartners.nameTooShortError.isPresent()).toBe(true)
      expect(HealthcarePartners.newPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.newPartnerCancelButton.click()

    it "name must be unique", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar"})

      HealthcarePartners.createPartner({ category: 'Hospital', name: "fooba", with_errors: true })
      HealthcarePartners.partnerNameField.sendKeys 'r'
      expect(HealthcarePartners.nameUniqueError.isPresent()).toBe(true)
      expect(HealthcarePartners.newPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.newPartnerCancelButton.click()
      HealthcarePartners.deletePartner("foobar")

    it "should not be unique by category", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar" })
      HealthcarePartners.createPartner({ category: 'Hospice', name: "foobar" })

      HealthcarePartners.deletePartner("foobar")
      HealthcarePartners.deletePartner("foobar")

    it "should clear name field if category is changed", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar", with_errors: true })
      expect(HealthcarePartners.partnerNameField.getAttribute('value')).toEqual "foobar"

      HealthcarePartners.partnerCatergorySelect.click()
      element(By.cssContainingText('option', "Hospice")).click()
      expect(HealthcarePartners.partnerNameField.getAttribute('value').getText()).toEqual ""

      HealthcarePartners.newPartnerCancelButton.click()

  describe 'edit action', ->

    it "category should be disabled on edit", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar" })
      HealthcarePartners.editPartner({ name: "foobar", with_errors: true })
      expect(HealthcarePartners.partnerCatergorySelect.isEnabled()).toBe(false)

      HealthcarePartners.editPartnerCancelButton.click()
      HealthcarePartners.deletePartner("foobar")

    it "name field is required", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar" })
      HealthcarePartners.editPartner({ name: "foobar", new_name: " ", with_errors: true })
      expect(HealthcarePartners.nameRequiredError.isPresent()).toBe(true)
      expect(HealthcarePartners.editPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.editPartnerCancelButton.click()
      HealthcarePartners.deletePartner("foobar")

    it "name must be at least two chars long", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar" })
      HealthcarePartners.editPartner({ name: "foobar", new_name: "f", with_errors: true })
      expect(HealthcarePartners.nameTooShortError.isPresent()).toBe(true)
      expect(HealthcarePartners.editPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.editPartnerCancelButton.click()
      HealthcarePartners.deletePartner("foobar")

    it "name must be unique", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar"})
      HealthcarePartners.createPartner({ category: 'Hospital', name: "1foobar"})

      HealthcarePartners.editPartner({ name: "1foobar", new_name: "fooba", with_errors: true })
      HealthcarePartners.partnerNameField.sendKeys 'r'
      expect(HealthcarePartners.nameUniqueError.isPresent()).toBe(true)
      expect(HealthcarePartners.editPartnerSaveButton.isEnabled()).toBe(false)

      HealthcarePartners.editPartnerCancelButton.click()
      HealthcarePartners.deletePartner("foobar")
      HealthcarePartners.deletePartner("foobar")

  describe 'delete action', ->

    it "should cancel confirm delete modal", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar" })
      searchField.sendKeys "foobar"
      expect(HealthcarePartners.editPartnerLink.isPresent()).toBe(true)
      HealthcarePartners.editPartnerLink.click()
      HealthcarePartners.partnerDeleteButton.click()
      HealthcarePartners.partnerDeleteCancelButton.click()

      HealthcarePartners.deletePartner("foobar")

    it "should delete partner", ->
      HealthcarePartners.createPartner({ category: 'Hospital', name: "foobar" })
      HealthcarePartners.deletePartner("foobar")
      searchField.sendKeys "foobar"
      expect(HealthcarePartners.editPartnerLink.isPresent()).toBe(false)

      OffCanvasNav.logout()