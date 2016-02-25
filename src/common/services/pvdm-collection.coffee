"use strict"

angular

  .module( "pvdm.services" )

  .service( "Collection", ($filter, $q, _, Record, COLLECTION_ERRORS) ->
  
    class Collection

      _pushUnique = (arr, val) ->
        return false if arr is null
        if arr and arr.indexOf(val) is -1
          arr.push(val)
          true

      constructor: (@records=[], @key=null, @reverse=false) ->
        if !angular.isArray(@records)
          #throw new Error(COLLECTION_ERRORS.RECORDS_INVALID)
          @records = []
        if !angular.isString(@key) and @key isnt null
          #throw new Error(COLLECTION_ERRORS.KEY_INVALID)
          @key=null
        if typeof @reverse isnt "boolean"
          #throw new Error(COLLECTION_ERRORS.REVERSE_INVALID)
          @reverse=false

      #
      # Set collection records
      set: (records) ->
        return unless angular.isArray(records)
        @clear()
        @records = records
        @sort()
        @

      #
      # Clear collection records
      clear: ->
        @records.length = 0
        @

      #
      # Sort by provided key
      sortBy: (key) ->
        if @key is key
          @reverse = !@reverse
        else
          @reverse = false
          @key = key
        @sort()

      #
      # Sort with current key
      sort: ->
        return if @key is null
        @records = $filter("orderBy")(@records, @key, @reverse)
        @

      #
      # Add record to collection
      add: (record) ->
        return unless angular.isObject(record)
        collection = @
        $q( (resolve, reject) ->
          collection.records.push( record )
          collection.sort()
          resolve(collection.records)
        )

      #
      # Delete record from collection
      # TODO: allow matching on all parameters, not just ID
      delete: (id) ->
        return unless angular.isNumber(id)
        _.remove(@records, (record) ->
          record.id is id
        )
        @

      #
      # Select provided record(s)
      select: (ids, referenceArray=null) ->
        collection = @
        $q( (resolve, reject) ->
          if angular.isArray(ids) or angular.isNumber(ids)
            collection.each( (record) ->
              if angular.isArray(ids)
                for id in ids
                  if record.setSelected(id, true)
                    _pushUnique(referenceArray, record.id)
              else
                if record.setSelected(ids, true)
                  _pushUnique(referenceArray, record.id)
              )
            collection.sort()
            resolve(collection.records)
          else
            throw new Error(COLLECTION_ERRORS.SELECT.IDS_INVALID)
            reject(collection)
        )

      #
      # Deselect provided record(s)
      deselect: (ids, referenceArray=null) ->
        collection = @
        $q( (resolve, reject) ->
          for record in collection.records
            if angular.isArray(ids)
              for id in ids
                record.setSelected(id, false)
            else
              record.setSelected(ids, false)
          if referenceArray
            referenceArray = _.difference(referenceArray, ids)
          collection.sort()
          resolve(collection.records)
        )

      #
      # Select all records
      selectAll: (referenceArray=null) ->
        collection = @
        $q( (resolve, reject) ->
          collection.each( (record) ->
            record.select()
            _pushUnique(referenceArray, record.id)
          )
          resolve(collection.records)
        )

      #
      # Deselect all records
      deselectAll: (referenceArray=null) ->
        collection = @
        $q( (resolve, reject) ->
          collection.each( (record) ->
            record.deselect()
          )
          angular.copy([], referenceArray) unless !referenceArray
          resolve(collection.records)
        )

      #
      # Toggle selection of all records
      toggleAll: () ->
        selected = !@allSelected
        @records.forEach( (record, index, records) ->
          records[index].$selected = selected
        )

      #
      # Get selected record ids
      getSelectedIds: ->
        @records.filter( (record) ->
          record.$selected
        ).map( (record) ->
          record.id
        )

      #
      # Iterate records and instantiate each as Record instance
      each: (callback) ->
        return unless angular.isFunction(callback)
        collection = @
        $q( (resolve, reject) ->
          for record, index in collection.records
            record = collection.records[index] = new Record(record)
            callback(record, index)
          resolve(collection)
        )

      #
      # Create unreferenced copy of collection
      copy: ->
        angular.copy(@records)

      # https://lodash.com/docs#where
      where: (props) ->
        _.filter( @records, _.matches(props) )

      # https://lodash.com/docs#pluck
      pluck: (property) ->
        _.map( @records, property )

      # https://lodash.com/docs#contains
      contains: (target, index) ->
        _.includes( @records, target, index )

      # https://lodash.com/docs#uniq
      unique: (sorted, callback, thisArg) ->
        _.uniq( @records, sorted, callback, thisArg )

      #
      # Get first record in collection
      first: ->
        @records[0]

      #
      # Get last record in collection
      last: ->
        @records[ @records.length - 1 ]

    Object.defineProperties(Collection.prototype,
      'allSelected':
        get: ->
          @records.length is @where({$selected:true}).length
      'noneSelected':
        get: ->
          @where({$selected:true}).length is 0
    )

    Collection
  )

  .constant( "COLLECTION_ERRORS",
    "RECORDS_INVALID": "Invalid value for 'records' in new Collection(records, key, reverse)"
    "KEY_INVALID": "Invalid value for 'key' in new Collection(records, key, reverse)"
    "REVERSE_INVALID": "Invalid value for 'reverse' in new Collection(records, key, reverse)"
    "SELECT":
      "IDS_INVALID": "Invalid value for 'ids' in Collection#select(ids, referenceArray)"
  )