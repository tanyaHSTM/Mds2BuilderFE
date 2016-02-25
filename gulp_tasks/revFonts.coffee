module.exports = (gulp, $) ->

  ->

    deferred = $.q.defer()

    gulp.task("rev_fonts", -> 
      gulp.src( ["./dev/fonts/*.woff"] )
        .pipe( $.rev() )
        .pipe( gulp.dest( "./dist/fonts" ) )
        .pipe( $.rev.manifest( "fonts.json" ) )
        .pipe( gulp.dest( "./dev/rev" ) )
    )

    gulp.task("rev_fontUrls", ->
      gulp.src( ["./dev/rev/fonts.json", "./dist/css/styles-*.css"] )
        .pipe( $.revCollector( replaceReved: true ) )
        .pipe( gulp.dest( "./dist/css" ) )
        .on("end", ->
          deferred.resolve()
        )
    )

    $.runSequence( "rev_fonts", "rev_fontUrls" )

    deferred.promise