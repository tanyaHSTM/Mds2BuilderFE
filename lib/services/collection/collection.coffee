'use strict'

angular

  .module('pvdm.services')

  .service('Collection', ($locale, naturalSort) ->

    #
    # Collection class
    Collection = (records=[]) ->
      @__records__ = records
      @

    Object.defineProperties(Collection::,
      'records':
        enumerable: true
        set: (records) ->
          @__records__ = records
        get: ->
          @__records__
      'add':
        value: (item) ->
          @records.push(item)
          @
      'remove':
        value: (item) ->
          idx = null
          for record,i in @records by -1
            if record.id is item.id
              idx = i
              break
          if idx? then @records.splice(idx, 1)
          @
      'contains':
        value: (item) ->
          contains = false
          for record,i in @records by -1
            if record.id is item.id
              contains = true
              break
          contains
      'selectAll':
        value: ->
          for item in @records by -1
            item.$selected = true
          @
      'deselectAll':
        value: ->
          for item in @records by -1
            item.$selected = false
          @
      'toggleAll':
        value: ->
          @allSelected and @deselectAll() or @selectAll()
          @
      'where':
        value: (obj) ->
          matches = []
          for item in @records by -1
            for prop,val of obj
              matches.unshift(item) if item[prop] is val
          new Collection(matches).sortBy(@sortKey)
      'pluck':
        value: (param) ->
          plucked = []
          for item in @records by -1
            plucked.unshift(item[param])
          plucked
      'sortKey':
        value: null
        writable: true
      'reversed':
        value: false
        writable: true
      'sortBy':
        value: (sortKey) ->
          return @ unless @sortKey or sortKey
          @reversed = false
          @records.sort( naturalSort(sortKey) )
          @sortKey = sortKey or @sortKey
          @
      'reverseSort':
        value: ->
          @reversed = !@reversed
          @records.reverse()
          @
      'length':
        enumerable: true
        get: ->
          @records.length
      'selected':
        enumerable: true
        get: ->
          @where({$selected:true})
      'noneSelected':
        enumerable: true
        get: ->
          @selected.length is 0
      'allSelected':
        enumerable: true
        get: ->
          @selected.length is @records.length
    )

    Collection
  )
