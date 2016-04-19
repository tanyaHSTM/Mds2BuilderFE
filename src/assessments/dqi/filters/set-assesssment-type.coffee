'use strict'

###
  For a provided type (numerical) return the
  matching translation key
###

angular

  .module( 'pvdm.assessments.dqi' )

  .filter( 'assessmentType', ( $filter, ASSESSMENT_TYPE )->
    (model, type) ->
      switch parseInt(type)
        when ASSESSMENT_TYPE.ADMISSION
          model.Y2 = "AD"
          model.AA8 = "01"
          model.AA9 = ""
          model.AB1 = $filter('daysAgoFormatted')(10)
        when ASSESSMENT_TYPE.QUARTERLY
          model.Y2 = "QA"
          model.AA8 = "05"
          model.AA9 = ""
          model.AB1 = $filter('daysAgoFormatted')(15)
        when ASSESSMENT_TYPE.ANNUAL
          model.Y2 = "FA"
          model.AA8 = "02"
          model.AA9 = ""
          model.AB1 = $filter('daysAgoFormatted')(20)
        when ASSESSMENT_TYPE.DISCHARGE
          model.Y2 = "DC"
          model.AA8 = "01"
          model.AA9 = "06"
          model.AB1 = $filter('daysAgoFormatted')(25)
  )