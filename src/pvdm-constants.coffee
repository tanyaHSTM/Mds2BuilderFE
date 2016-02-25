"use strict"

angular

  .module( "pvdm.constants" )

  .constant( "MDS2", Object.defineProperties( {},
    "NAME":
      value: "MDS2 Builder"
    "PRODUCTION_DOMAIN":
      value: "mds2builder.heroku.com"
    "DEFAULT_LANGUAGE":
      value: "en-US"
  ))

  .constant( "PATHS", Object.defineProperties( {},
    "START_PAGE":
      value: "/mds2"
    "LOCALES":
      value: "/locales"
  ))

  .constant( "REGEX", Object.defineProperties( {},
    "EMAIL":
      value: /^((?:[\w\.%\+\-\'])+@(?:[A-Z0-9\-]+\.)+(?:com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum|[A-Z]{2}))$/i
    "PASSWORD":
      value: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){10,40}$/
    "NAME":
      value: /^[^<>]*$/
    "LOGIN":
      value: /^\w[\w\.\-_@']+$/
    "GENERIC_TEXT":
      value: /^[a-zA-Z0-9&:;\-_.,!?*\[\]()\\\/'"$@#%^ ]+$/
    "GENERIC_1000":
      value: /^.{1,1000}$/
    "ALPHA_NUMERIC":
      value: /^[a-zA-Z0-9]+$/
    "ALPHA_NUM_SPACE":
      value: /^[a-zA-Z0-9 ]+$/
    "ALPHA":
      value: /^[a-zA-Z]+$/
    "NUMERIC":
      value: /^([0-9]+)$/
    "SSN":
      value: /^\d{3}-?\d{2}-?\d{4}$/
    "UUID":
      value: /^[\dA-F]{8}-[\dA-F]{4}-[\dA-F]{4}-[\dA-F]{4}-[\dA-F]{12}$/
    "IP_ADDRESS":
      value: /^\d{1,3}(\.\d{1,3}){3}$/
    "READABLE_DATE":
      value: /^([A-Za-z]){3}\s([0-9]){1,2},\s([0-9]){4}$/
  ))
