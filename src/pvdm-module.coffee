'use strict'

angular.module( 'templates', [])

angular.module( 'pvdm.constants', [])

angular

  .module( 'pvdm', [

    #
    # Third party modules
    'ui.bootstrap',
    'ui.router',
    'pascalprecht.translate',
    'schemaForm',
    'templates',
    'reTree',
    'ng.deviceDetector',

    #
    # PVDM Modules
    'pvdm.directives',
    'pvdm.previousUrl',
    'pvdm.messages',
    'pvdm.datepicker',
    'pvdm.constants',
    'pvdm.filters',
    'pvdm.directives',
    'pvdm.services',
    'pvdm.components',
    'pvdm.httpErrors',
    'pvdm.mds2',
    'pvdm.residents',

    #
    # Angular addOn Modules
    'ngMessages',
    'ngCookies',
    'ngAnimate',
    'ngTouch'


  ])
