module.exports = (gulp, $) ->

  ->

    deferred = $.q.defer()

    gulp.task("rev_css", -> 
      gulp.src( ["./dev/css/styles.css"] )
        .pipe( $.cssnano() )
        .pipe( $.rev() )
        .pipe( gulp.dest( "./dist/css" ) )
        .pipe( $.rev.manifest( "styles.json" ) )
        .pipe( gulp.dest( "./dev/rev" ) )
    )

    gulp.task("rev_cssUrls", ->
      gulp.src( ["./dev/rev/styles.json","./dist/index.html"] )
        .pipe( $.revCollector( replaceReved: true ) )
        .pipe( gulp.dest( "./dist/" ) )
        .on("end", ->
          deferred.resolve()
        )
    )

    $.runSequence( "rev_css", "rev_cssUrls" )

    deferred.promise