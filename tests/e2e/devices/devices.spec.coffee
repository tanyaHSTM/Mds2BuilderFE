LoginPage = require('../login/login.po.coffee')
OffCanvasNav = require('../off-canvas-nav/off-canvas-nav.po.coffee')
Facilities = require('../facilities/facilities.po.coffee')
Devices = require('./devices.po.coffee')

describe 'crud devices', ->

  describe 'new action', ->
    
    it "should navigate to devices", ->
      browser.get(baseUrl + loginUrl)
      LoginPage.loginAsAbaqisUser()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + facilitiesUrl)

      Facilities.facilitiesList.get(0).click()
      Facilities.devicesTab.click()

    it "device_id field is required", ->
      Devices.createDevice({ device_id: " ", with_errors: true })
      expect(Devices.idRequiredError.isPresent()).toBe(true)
      expect(Devices.newDeviceSaveButton.isEnabled()).toBe(false)

      Devices.newDeviceCancelButton.click()

    it "device_id must be correct format", ->
      Devices.createDevice({ device_id: "1B75C673-89CC-441E9F9F-414A4238FD83", with_errors: true })
      expect(Devices.formatError.isPresent()).toBe(true)
      expect(Devices.newDeviceSaveButton.isEnabled()).toBe(false)

      Devices.newDeviceCancelButton.click()

    it "device_id must be unique", ->
      Devices.createDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD83"})
      Devices.createDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD83", with_errors: true })
      expect(Devices.idUniqueError.isPresent()).toBe(true)
      expect(Devices.newDeviceSaveButton.isEnabled()).toBe(false)

      Devices.newDeviceCancelButton.click()
      Devices.deleteDevice()

  describe 'edit action', ->

    it "device_id field is required", ->
      Devices.createDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD83" })
      Devices.editDevice({ device_id: " ", with_errors: true })
      expect(Devices.idRequiredError.isPresent()).toBe(true)
      expect(Devices.editDeviceSaveButton.isEnabled()).toBe(false)

      Devices.editDeviceCancelButton.click()
      Devices.deleteDevice()

    it "device_id must be correct format", ->
      Devices.createDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD83" })
      Devices.editDevice({ device_id: "1B75C67-89CC-441E-9F9F-414A4238FD83", with_errors: true })
      expect(Devices.formatError.isPresent()).toBe(true)
      expect(Devices.editDeviceSaveButton.isEnabled()).toBe(false)

      Devices.editDeviceCancelButton.click()
      Devices.deleteDevice()

    it "device_id must be unique", ->
      Devices.createDevice({ device_id: "2B75C673-89CC-441E-9F9F-414A4238FD83"})
      Devices.createDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD83"})
      Devices.editDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD83", with_errors: true })
      expect(Devices.idUniqueError.isPresent()).toBe(true)
      expect(Devices.editDeviceSaveButton.isEnabled()).toBe(false)

      Devices.editDeviceCancelButton.click()
      Devices.deleteDevice()
      Devices.deleteDevice()

  describe 'delete action', ->

    it "should cancel confirm delete modal", ->
      Devices.createDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD82" })
      expect(Devices.editDeviceLink.isPresent()).toBe(true)
      Devices.editDeviceLink.click()
      Devices.deviceDeleteButton.click()
      Devices.deviceDeleteCancelButton.click()

      Devices.deleteDevice()

    it "should delete partner", ->
      Devices.createDevice({ device_id: "1B75C673-89CC-441E-9F9F-414A4238FD82" })
      Devices.deleteDevice()

      OffCanvasNav.logout()