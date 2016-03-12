"use strict"

###
  Subtract days from a particular date
###

angular

  .module( "pvdm.assessments.dqi" )

  .filter("daysAgoFormatted", ($filter) ->
    (days) ->
      date = today = new Date()
      hours = (days * 24)
      date = new Date(date.getTime() - (hours*60*60*1000))
      date = $filter('date')(date, 'yyyyMMdd')
      date
  )