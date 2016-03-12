"use strict"

angular

  .module( "pvdm.constants" )

  .constant( "REGEX", Object.defineProperties( {},
    "NUMERIC":
      value: /^([0-9]+)$/
    "DAYS":
      value: /^[0-7]$/
    "VISITS":
      value: /^([0-9]|[0-1][0-4])$/
  ))

   .constant( "ASSESSMENT_TYPE",
    "ADMISSION": 1
    "ANNUAL": 2
    "CHANGE_STATUS": 3
    "CORRECTION_FULL": 4
    "QUARTERLY": 5
    "CORRECTION_QUARTERLY": 6
    "DISCHARGE": 7
  )
