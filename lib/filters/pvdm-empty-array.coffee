"use strict"

###
  For a collection, conditionally return a subset where
  the given parameter is an empty array
###

angular

  .module( "pvdm.filters" )

  .filter( "pvdmEmptyArray", ->
    (items, param, applyFilter=false) ->

      # Return all items unless applyFilter is truthy
      return items unless !!applyFilter

      # Otherwise, return matching records only
      filtered = []

      for item in items
        filtered.push( item ) unless item[param]?.length

      filtered
  )