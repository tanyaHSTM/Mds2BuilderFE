//npm install -g protractor //install protractor globally
//webdriver-manager update //download necessary binaries

// webdriver-manager start       //start webserver
// protractor tests/e2e/conf.js  //run test
exports.config = {
  framework: 'jasmine',
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['./**/*.spec.coffee'],

  // --suite=login,payors only the patterns matched by the specified suites will run
  suites: {
    login:  './**/login.spec.coffee',
    ocn:    './**/off-canvas-nav.spec.coffee',
    hcp:    './**/healthcare-partners.spec.coffee',
    payors: './**/payors.spec.coffee',
    devices:'./**/devices.spec.coffee',
    full:   './**/*.spec.coffee'
  },

  // globals
  onPrepare: function() {
    // urls
    baseUrl = 'http://localhost:3000/nr#'
    loginUrl = '/login'
    facilitiesUrl ='/manage/facilities'
    usersUrl = '/manage/users'
    mdsUrl = '/manage/mds'
    notificationsUrl = '/notifications'

    // global variables
    qaLogin = 'phil'
    qaEmail = 'pdoise@providigm.com'
    qaPassword = 'Denver2016'

    searchField = element(By.id('search-input'))
    searchClear = element(By.id('search-cancel'))

    // stickies
    successStickie     = element(By.css(".alert-success"))
    failStickie        = element(By.css(".alert-danger"))
    closeStickieButton = element(By.css(".alert")).element(By.css(".close"))
  }
}