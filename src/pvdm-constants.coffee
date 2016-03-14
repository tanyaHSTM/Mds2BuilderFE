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
    "PAGINATION_LIMIT":
      value: 5
  ))

  .constant( "PATHS", Object.defineProperties( {},
    "START_PAGE":
      value: "/dqi/single"
    "LOCALES":
      value: "/locales"
  ))

  .constant( "REGEX", Object.defineProperties( {},
    "NUMERIC":
      value: /^([0-9]+)$/
    "DAYS":
      value: /^[0-7]$/
    "VISITS":
      value: /^([0-9]|[0-1][0-4])$/
  ))
