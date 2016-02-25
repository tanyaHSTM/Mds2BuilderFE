module.exports = (gulp, $) ->

  ->
    gulp.src( "./dev/index.html" )
      .pipe(
        $.htmlmin(
          collapseWhitespace: true
          removeComments: true
          removeAttributeQuotes: true
        )
      )
      .pipe( gulp.dest( "./dist" ) )
