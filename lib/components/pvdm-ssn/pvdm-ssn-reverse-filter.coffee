'use strict'

angular

  .module('pvdmSSN')

  .filter('ssnReverse', ->
    (value) ->
      if !!value
        value.replace(/\D/g, '').substr(0, 9)
      value
  )
