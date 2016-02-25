class HealthCarePartners
    # buttons
    @addNewPartnerButton        = element(By.id('add-partner-button'))
    @newPartnerSaveButton       = element(By.id('new-partner-save'))
    @newPartnerCancelButton     = element(By.id('new-partner-cancel'))
    @editPartnerSaveButton      = element(By.id('edit-partner-save'))
    @editPartnerCancelButton    = element(By.id('edit-partner-cancel'))
    @editPartnerLink            = element(By.xpath("(//a[contains(text(),'Edit')])[1]"))
    @partnerDeleteButton        = element(By.id('edit-partner-delete'))
    @partnerDeleteConfirmButton = element(By.id('partner-confirm-delete'))
    @partnerDeleteCancelButton  = element(By.id('partner-confirm-cancel'))
    # fields
    @partnerCatergorySelect = element(By.id('partner-category-select'))
    @partnerNameField       = element(By.id('partner-name-field'))
    @partnerNoteField       = element(By.id('partner-notes-field'))    
    # objects
    @partnersList           = element.all(By.repeater('partner in partnersCtrl.partners.records'))
    @nameRequiredError      = element(By.id("partner-name-required-message"))
    @nameTooShortError      = element(By.id("partner-name-short-message"))
    @nameUniqueError        = element(By.id("partner-name-unique-message"))
    # methods
    @createPartner = (options) ->
        options     = options || {}
        category    = options.category || 'Hospital'
        name        = options.name || "foobar"
        note        = options.note || "note"
        with_errors = options.with_errors || false

        expect(@addNewPartnerButton.isPresent()).toBe(true)
        @addNewPartnerButton.click()
        @partnerCatergorySelect.click()
        element(By.cssContainingText('option', category)).click()
        @partnerNameField.sendKeys name
        @partnerNoteField.sendKeys note

        if with_errors == false
          @newPartnerSaveButton.click()
          expect(successStickie.isPresent()).toBe(true)

    @editPartner = (options) ->
        options     = options || {}
        name        = options.name || "foobar"
        new_name    = options.new_name || "foobar"
        note        = options.note || "note"
        with_errors = options.with_errors || false

        expect(@addNewPartnerButton.isPresent()).toBe(true)
        searchField.clear()
        searchField.sendKeys name
        expect(@editPartnerLink.isPresent()).toBe(true)
        @editPartnerLink.click()

        @partnerNameField.clear()
        @partnerNoteField.clear()

        @partnerNameField.sendKeys new_name
        @partnerNoteField.sendKeys note

        if with_errors == false
          @editPartnerSaveButton.click()
          expect(successStickie.isPresent()).toBe(true)

    @deletePartner = (name) ->
        expect(@addNewPartnerButton.isPresent()).toBe(true)
        searchField.clear()
        searchField.sendKeys name
        expect(@editPartnerLink.isPresent()).toBe(true)
        @editPartnerLink.click()
        @partnerDeleteButton.click()
        @partnerDeleteConfirmButton.click()
        expect(successStickie.isPresent()).toBe(true)

module.exports = HealthCarePartners