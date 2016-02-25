module.exports = (gulp, $) ->

  ->
    gulp.src( ["./dist/*"], read: false )
      .pipe( $.vinylPaths $.del )

