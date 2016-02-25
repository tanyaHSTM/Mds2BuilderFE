module.exports = (gulp, $) ->

  ->

    gulp.src( "./dev/locales/*.json" )
      .pipe( $.jsonminify() )
      .pipe( $.rev() )
      .pipe( gulp.dest( "./dist/locales" ) )
      .pipe( $.rev.manifest("locales.json") )
      .pipe( gulp.dest( "./dev/rev" ) )
