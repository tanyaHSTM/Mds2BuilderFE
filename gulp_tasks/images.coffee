module.exports = (gulp, $) ->

  ->
    gulp.src( ["./src/**/*.{png,gif,jpg,svg}", "!./src/**/*/glyphicons-regular.svg"] )
      .pipe( $.flatten() )
      .pipe( gulp.dest( "./dev/img" ) )
