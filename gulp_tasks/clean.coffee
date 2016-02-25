module.exports = (gulp, $) ->

  ->
    gulp.src( ["./dev","./dist"], read: false )
      .pipe( $.vinylPaths $.del )

