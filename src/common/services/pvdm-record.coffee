"use strict"

angular

  .module( "pvdm.services" )

  .service( "Record",(_, RECORD_ERRORS) ->

    class Record

      constructor: (record={}) ->
        if _.isString(record) or !_.keys(record).length and !_.isEqual(record, {})
          throw new Error(RECORD_ERRORS.RECORD_INVALID)
          record = {}
        angular.extend(@, record, $selected: false)

      setSelected: (id, selected) ->
        if typeof id isnt "number"
          throw new Error(RECORD_ERRORS.SET_SELECTED.ID_INVALID)
          false
        if typeof selected isnt "boolean"
          throw new Error(RECORD_ERRORS.SET_SELECTED.SELECTED_INVALID)
          false
        record = @
        if id is +record.id
          record.$selected = selected
        else
          false

      select: ->
        @$selected = true
        @

      deselect: ->
        @$selected = false
        @

  )

  .constant( "RECORD_ERRORS",
    "RECORD_INVALID": "Invalid value for 'record' in new Record(record)"
    "SET_SELECTED":
      "ID_INVALID": "Invalid value for 'id' in Record#setSelected(id, selected)"
      "SELECTED_INVALID": "Invalid value for 'selected' in Record#setSelected(id, selected)"
  )