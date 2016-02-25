module.exports = (gulp, $) ->

  ->
    gulp.src( ["./lib/components/pvdm-icon/fonts/*.{woff2,woff}"] )
      .pipe( $.flatten() )
      .pipe( gulp.dest( "./dev/fonts" ) )
