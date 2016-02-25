class Facilities
    # links
    @facilitiesList        = element.all(By.repeater('facility in facilitiesCtrl.facilities.records'))
    @assignedUsersTab      = element(By.id('assigned-users-tab'))
    @healthCarePartnersTab = element(By.id('healthcare-partners-tab'))
    @payorsTab             = element(By.id('payors-tab'))
    @devicesTab            = element(By.id('devices-tab'))

module.exports = Facilities