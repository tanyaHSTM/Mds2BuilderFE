"use strict"

###
  Capitalize first letter of string
###

angular

  .module( "pvdm.filters" )

  .filter( 'capitalize', ->
    (input) ->

      if input != null
        input = input.toLowerCase()
        input.substring(0, 1).toUpperCase() + input.substring(1)
  )