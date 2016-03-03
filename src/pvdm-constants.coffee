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
      value: "/assessment_form"
    "LOCALES":
      value: "/locales"
  ))
