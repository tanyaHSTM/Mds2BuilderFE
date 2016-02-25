"use strict"

angular

  .module( "pvdm.services" )

  .factory("pvdmRevLocaleLoader", ($q, $http, $log) ->

    (options) ->

      $q( (resolve, reject) ->

        file = {
          "en-us": "en-us.json"
          "en-ca": "en-ca.json"
          "fr-ca": "fr-ca.json"
          "es-mx": "es-mx.json"
        }[options.key]

        $http.get("/locales/#{file}").then( (translations) ->
          resolve(translations.data)
        , (error) ->
          reject(options.key)
        )

      )

  )