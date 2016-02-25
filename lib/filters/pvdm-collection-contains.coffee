"use strict"

###
  Check for value in collection (object|array|string)
  see https://lodash.com/docs#includes
###

angular

  .module( "pvdm.filters" )

  .filter( "pvdmCollectionContains", (_) ->
    (allItems, needle, haystack) ->

      # Show all records if no specific values to reference
      if !needle or !haystack then return allItems

      # Don't treat #s (IDs) as strings
      if (/^(\d)+$/).test(needle)
        needle = parseInt(needle)

      # Return matching records only
      filteredItems = []

      for item in allItems
        if angular.isArray(haystack) and _.includes(haystack, item[needle])
          filteredItems.push(item)
        else if angular.isString(haystack) and _.includes(item[haystack], needle)
          filteredItems.push(item)

      filteredItems
  )