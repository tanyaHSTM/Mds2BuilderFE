class LoginPage 
    @pageTitle              = ("abaqis | Login")
    # inputs
    @loginField             = element(By.id("login-field"))
    @passwordField          = element(By.id("password-field"))
    @loginSubmitButton      = element(By.id("login-submit"))    
    # objects
    @passwordRequestLink    = element(By.id("forgot-password-link"))
    @loginRequiredError     = element(By.id("login-required-message"))
    @passwordRequiredError  = element(By.id("password-required-message"))
    # methods
    @loginAsAbaqisUser = ->
      expect(browser.getCurrentUrl()).toEqual(baseUrl + loginUrl)
      @loginField.sendKeys qaLogin
      @passwordField.sendKeys qaPassword
      @loginSubmitButton.click()

    @ipBlock = ->
      i = 0
      while i < 26
        @loginField.sendKeys Math.random().toString(36).substring(7)
        @passwordField.sendKeys Math.random().toString(36).substring(7)
        @loginSubmitButton.click()
        @loginField.clear()
        @passwordField.clear()
        i++
  
module.exports = LoginPage