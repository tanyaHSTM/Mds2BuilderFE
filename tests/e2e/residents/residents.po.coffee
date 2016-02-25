class Residents
    # buttons
    @manageResidentsButton       = element(By.id('manage-residents-button'))
    @addResidentLink             = element(By.id('add-resident-link'))
    @findDuplicatesLink          = element(By.id('find-duplicates-link'))
    @newResidentCancelButton     = element(By.id('new-resident-cancel'))
    @newResidentSaveButton       = element(By.id('new-resident-save'))
    @editResidentCancelButton    = element(By.id('edit-resident-cancel'))
    @editResidentSaveButton      = element(By.id('edit-resident-save'))
    @residentDeleteButton        = element(By.id('resident-delete-button'))
    @residentDeleteConfirmButton = element(By.id('resident-confirm-delete'))
    @residentDeleteCancelButton  = element(By.id('resident-confirm-cancel'))
    # fields
    @residentFirstNameField      = element(By.id('resident-first-name'))
    @residentLastNameField       = element(By.id('resident-last-name'))
    @residentMiddleInitialField  = element(By.id('resident-middle-initial'))
    @residentMaleButton          = element(By.id('reisdent-male-button'))
    @residentFemaleButton        = element(By.id('reisdent-female-button'))
    @residentIdentifierField     = element(By.id('resident-identifier'))
    @residentRoomField           = element(By.id('resident-room'))
    @residentNicknameField       = element(By.id('resident-nickname'))   
    # objects
    @residentList                = element.all(By.repeater('resident in residentsCtrl.residents.records'))
    @firstNameRequiredError      = element(By.id("first-name-required-message"))
    @lastNameRequiredError       = element(By.id("last-name-required-message"))
    @bdayRequiredError           = element(By.id("bday-required-message"))
    @identifierUniqueError       = element(By.id("identifier-unique-message"))
    @identifierTooShortError     = element(By.id("identifier-short-message"))

module.exports = Residents