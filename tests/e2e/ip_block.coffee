LoginPage = require('./login/login.po.coffee')

describe 'login page', ->

  describe 'ip block', ->
    
    browser.get LoginPage.loginUrl
    
    it "login incorrectly 25 times", ->
      LoginPage.ipBlock()