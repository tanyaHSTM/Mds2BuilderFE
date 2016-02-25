config = require("./config.json")

module.exports = (gulp, $) ->

  ->

    gulp.src( config.vendor_js )
      .pipe( $.changed( "./dev/js" ) )
      .pipe( $.stripComments({line:true}) )
      .pipe( $.concat( "vendor.js" ) )
      .pipe( gulp.dest( "./dev/js" ) )
