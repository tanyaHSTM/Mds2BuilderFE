"use strict"

angular

  .module( "pvdm.services" )

  .service( "DateConstructor", () ->

    class DateConstructor
    
    format: (date) ->
      year = date.getFullYear()
      month = (1 + date.getMonth()).toString()
      month = if month.length > 1 then month else '0' + month
      day = date.getDate().toString()
      day = if day.length > 1 then day else '0' + day
      year + '' + month + '' + day

    subtract: (days) ->
      date = new Date(@valueOf())
      date.setDate date.getDate() + days
      date

  )
