module.exports = (gulp, $) ->

  ->
    gulp.src( "./src/index.html" )
      .pipe( gulp.dest( "./dev" ) )
