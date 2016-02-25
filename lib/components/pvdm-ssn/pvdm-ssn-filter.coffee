'use strict'

angular

  .module('pvdmSSN')

  .filter('ssn', ->
    (value, mask=false) ->
      if value
        val = value.toString().replace(/\D/g, '')
        len = val.length
        if len < 4
          return val
        else if 3 < len < 6
          return "#{val.substr(0, 3)}-#{val.substr(3)}"
        else if 5 < len < 9
          return "#{val.substr(0, 3)}-#{val.substr(3, 2)}-#{val.substr(5)}"
        else if len is 9
          if mask
            return "***-**-#{val.substr(5, 4)}"
          else
            return "#{val.substr(0, 3)}-#{val.substr(3, 2)}-#{val.substr(5, 4)}"
      value
  )
