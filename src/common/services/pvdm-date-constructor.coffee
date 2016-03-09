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

    subtractHours: (date, hours) ->
      date = new Date(date.getTime() - (hours*60*60*1000))
      date

  )
