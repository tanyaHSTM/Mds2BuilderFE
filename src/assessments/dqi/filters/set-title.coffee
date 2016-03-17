'use strict'

###
  For a provided type (numerical) return the
  matching translation key
###

angular

  .module( 'pvdm.assessments.dqi' )

  .filter( 'setTitle', ( ASSESSMENT_TYPE )->
    (type) ->
      switch parseInt(type)
        when ASSESSMENT_TYPE.ADMISSION then return 'Admission'
        when ASSESSMENT_TYPE.ANNUAL then return 'Annual'
        when ASSESSMENT_TYPE.CHANGE_STATUS then return 'Change in Status'
        when ASSESSMENT_TYPE.CORRECTION_FULL then return 'Correction of Full'
        when ASSESSMENT_TYPE.QUARTERLY then return 'Quarterly'
        when ASSESSMENT_TYPE.CORRECTION_QUARTERLY then return 'Correction of Quarterly'
        when ASSESSMENT_TYPE.DISCHARGE then return 'Discharge'
        else '--'
  )