"use strict"

angular

  .module( "pvdm.constants" )

  .constant( "REGEX", Object.defineProperties( {},
    "NUMERIC":
      value: /^([0-9]+)$/
    "DAYS":
      value: /^[0-7]$/
    "VISITS":
      value: /^0[1-9]|1[0-4]$/
  ))
