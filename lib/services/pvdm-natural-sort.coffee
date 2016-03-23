'use strict'

###
  Provides natural sort of numbers/dates
  Stolen from: https://bitbucket.org/OverZealous/angularjs-naturalsort
###

angular

  .module('pvdm.services')

  .service('naturalSort', ($locale) ->

    (sortKey) ->

      #
      # Zero pad number
      pad = (value) ->
        '00000000000000000000'.slice(value.length)

      #
      # Fix numbers w/padding for accurate sorting
      fixNumbers = (value) ->
        value.replace( /(\d+)((\.\d+)+)?/g, ($0, integer, decimal, $3) ->
          if decimal isnt $3
            $0.replace /(\d+)/g, ($d) ->
              pad($d) + $d
          else
            decimal = decimal or '.0'
            "#{pad(integer)}#{integer}#{decimal}#{pad(decimal)}"
        )

      #
      # Make it an integer...kidding
      toString = (value) ->
        return '' unless value?
        return "#{value}"

      #
      # Month first format?
      monthFirst = $locale.DATETIME_FORMATS.shortDate.charAt(0) is 'M'

      #
      # Fix date format
      fixDates = (value) ->
        toString(value).replace( /(\d\d?)[-\/\.](\d\d?)[-\/\.](\d{4})/, ($0, $m, $d, $y) ->
          t = $d
          if !monthFirst
            if Number($d) < 13
              $d = $m
              $m = t
          else if Number($m) > 12
            $d = $m
            $m = t
          "#{$y}-#{$m}-#{$d}"
        )

      #
      # Build sortable string
      natValue = (value) ->
        fixNumbers( fixDates(value) )

      #
      # Return sort method
      return (a,b) =>
        a = natValue( a[sortKey] )
        b = natValue( b[sortKey] )
        return -1 if a < b
        return 1 if a > b
        return 0

  )
