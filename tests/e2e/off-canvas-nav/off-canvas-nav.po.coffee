class OffCanvasNav 
    # links
    @navIcon            = element(By.id('ocn-nav-icon'))
    @facilitiesLink     = element(By.id('ocn-facilities-link'))
    @usersLink          = element(By.id('ocn-users-link'))
    @mdsLink            = element(By.id('ocn-mds-link'))
    @notifyBell         = element(By.id('navbar-notification-icon'))
    @helpIcon           = element(By.id('navbar-help-icon'))
    @userNav            = element(By.id('user-navigation'))
    @changePasswordLink = element(By.id('user-nav-change-password'))
    @logoutLink         = element(By.id('user-nav-logout'))
    # inputs
    @currentPassword    = element(By.id('current-password'))
    @newPassword        = element(By.id('new-password'))
    @confirmPassword    = element(By.id('confirm-password'))
    @passwordSubmit     = element(By.id('change-password-submit'))
    @passwordCancel     = element(By.id('change-password-cancel'))
    # methods
    @logout = ->
      @userNav.click()
      @logoutLink.click()
      expect(browser.getCurrentUrl()).toEqual(baseUrl + loginUrl)

    @changePassword = (old_pwd, new_pwd, new_pwd_confirm) ->
      @userNav.click()
      @changePasswordLink.click()
      @currentPassword.sendKeys old_pwd
      @newPassword.sendKeys new_pwd
      @confirmPassword.sendKeys new_pwd_confirm
      @passwordSubmit.click()

module.exports = OffCanvasNav