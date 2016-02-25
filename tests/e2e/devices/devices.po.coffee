class Devices
    # buttons
    @addNewDeviceButton        = element(By.id('add-device-button'))
    @newDeviceSaveButton       = element(By.id('new-device-save'))
    @newDeviceCancelButton     = element(By.id('new-device-cancel'))
    @editDeviceSaveButton      = element(By.id('edit-device-save'))
    @editDeviceCancelButton    = element(By.id('edit-device-cancel'))
    @editDeviceLink            = element(By.xpath("(//a[contains(text(),'Edit')])[1]"))
    @deviceDeleteButton        = element(By.id('edit-device-delete'))
    @deviceDeleteConfirmButton = element(By.id('device-confirm-delete'))
    @deviceDeleteCancelButton  = element(By.id('device-confirm-cancel'))
    # fields
    @deviceIdField             = element(By.id('device-id-field'))
    @deviceNoteField           = element(By.id('device-note-field'))    
    # objects
    @deviceList                = element.all(By.repeater('device in devicesCtrl.devices.records'))
    @idRequiredError           = element(By.id("device-id-required-message"))
    @formatError               = element(By.id("device-format-message"))
    @idUniqueError             = element(By.id("device-id-unique-message"))
    # methods
    @createDevice = (options) ->
        options     = options || {}
        category    = options.category || 'Private Pay'
        device_id   = options.device_id || "3B75C673-89CC-441E-9F9F-414A4238FD83"
        note        = options.note || "note"
        with_errors = options.with_errors || false

        expect(@addNewDeviceButton.isPresent()).toBe(true)
        @addNewDeviceButton.click()
        @deviceIdField.sendKeys device_id
        @deviceNoteField.sendKeys note

        if with_errors == false
          @newDeviceSaveButton.click()
          expect(successStickie.isPresent()).toBe(true)

    @editDevice = (options) ->
        options     = options || {}
        device_id   = options.device_id || "3B75C673-89CC-441E-9F9F-414A4238FD83"
        note        = options.note || "note"
        with_errors = options.with_errors || false

        expect(@addNewDeviceButton.isPresent()).toBe(true)
        expect(@editDeviceLink.isPresent()).toBe(true)
        @editDeviceLink.click()

        @deviceIdField.clear()
        @deviceNoteField.clear()

        @deviceIdField.sendKeys device_id
        @deviceNoteField.sendKeys note

        if with_errors == false
          @editDeviceSaveButton.click()
          expect(successStickie.isPresent()).toBe(true)

    @deleteDevice = ->
        expect(@addNewDeviceButton.isPresent()).toBe(true)
        expect(@editDeviceLink.isPresent()).toBe(true)
        @editDeviceLink.click()
        @deviceDeleteButton.click()
        @deviceDeleteConfirmButton.click()
        expect(successStickie.isPresent()).toBe(true)

module.exports = Devices