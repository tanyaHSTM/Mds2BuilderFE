class Payors
    # buttons
    @addNewPayorButton        = element(By.id('add-payor-button'))
    @newPayorSaveButton       = element(By.id('new-payor-save'))
    @newPayorCancelButton     = element(By.id('new-payor-cancel'))
    @editPayorSaveButton      = element(By.id('edit-payor-save'))
    @editPayorCancelButton    = element(By.id('edit-payor-cancel'))
    @editPayorLink            = element(By.xpath("(//a[contains(text(),'Edit')])[1]"))
    @payorDeleteButton        = element(By.id('edit-payor-delete'))
    @payorDeleteConfirmButton = element(By.id('payor-confirm-delete'))
    @payorDeleteCancelButton  = element(By.id('payor-confirm-cancel'))
    # fields
    @payorCatergorySelect     = element(By.id('payor-category-select'))
    @payorNameField           = element(By.id('payor-name-field'))
    @payorNoteField           = element(By.id('payor-note-field'))    
    # objects
    @payorList                = element.all(By.repeater('payor in payorsCtrl.payors.records'))
    @nameRequiredError        = element(By.id("payor-name-required-message"))
    @nameTooShortError        = element(By.id("payor-name-short-message"))
    @nameUniqueError          = element(By.id("payor-name-unique-message"))
    # methods
    @createPayor = (options) ->
        options     = options || {}
        category    = options.category || 'Private Pay'
        name        = options.name || "1foobar"
        note        = options.note || " "
        with_errors = options.with_errors || false

        expect(@addNewPayorButton.isPresent()).toBe(true)
        @addNewPayorButton.click()
        @payorCatergorySelect.click()
        element(By.cssContainingText('option', category)).click()
        @payorNameField.sendKeys name
        @payorNoteField.sendKeys note

        if with_errors == false
          @newPayorSaveButton.click()
          expect(successStickie.isPresent()).toBe(true)

    @editPayor = (options) ->
        options     = options || {}
        name        = options.name || "1foobar"
        note        = options.note || " "
        with_errors = options.with_errors || false

        expect(@addNewPayorButton.isPresent()).toBe(true)
        expect(@editPayorLink.isPresent()).toBe(true)
        @editPayorLink.click()

        @payorNameField.clear()
        @payorNoteField.clear()

        @payorNameField.sendKeys name
        @payorNoteField.sendKeys note

        if with_errors == false
          @editPayorSaveButton.click()
          expect(successStickie.isPresent()).toBe(true)

    @deletePayor = ->
        expect(@addNewPayorButton.isPresent()).toBe(true)
        expect(@editPayorLink.isPresent()).toBe(true)
        @editPayorLink.click()
        @payorDeleteButton.click()
        @payorDeleteConfirmButton.click()
        expect(successStickie.isPresent()).toBe(true)

module.exports = Payors