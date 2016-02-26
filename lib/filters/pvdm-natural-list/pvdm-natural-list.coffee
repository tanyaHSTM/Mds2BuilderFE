"use strict"

angular

  .module( "pvdm.filters" )

  .filter( "pvdmNaturalListFilter", ->
    (listArr) ->
      list = ""
      return listArr[0] unless listArr.length > 1
      for item, i in listArr
        if i is 0
          list += "#{item}"
        else if 0 < i <= listArr.length-2
          list += ", #{item}"
        else
          list += " and #{item}"
      return list
  )