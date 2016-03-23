"use strict"

###
  Put elipsis on long text
###

angular

  .module( "pvdm.filters" )

  .filter 'elipsis', ($filter) ->
    (input, limit) ->
      if !input
        return
      if input.length <= limit
        return input
      $filter('limitTo')(input, limit) + '...'