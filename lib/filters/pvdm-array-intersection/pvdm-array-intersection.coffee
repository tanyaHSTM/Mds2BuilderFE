"use strict"

###
  For a collection, return a subset where a records
  param intersects with the given referenceArray
###

angular

  .module( "pvdm.filters" )

  .filter( "pvdmArrayIntersection", (_) ->
    (items, param, referenceArray) ->

      # Show all records if no specific values to reference
      if _.isEmpty(referenceArray) then return items

      # Otherwise, return matching records only
      filtered = []
      for item in items
        if angular.isArray(item[param])
          if _.intersection(item[param], referenceArray).length > 0
            filtered.push(item)
      filtered
  )