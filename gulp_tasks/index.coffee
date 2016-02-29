module.exports = (gulp, $) ->

  ->
    gulp.src( "./src/index.ejs" )
      .pipe( gulp.dest( "./dev" ) )
