
module.exports = (gulp, $) ->

  ->

    deferred = $.q.defer()

    gulp.task("rev_js", -> 
      gulp.src( ["./dev/js/*.js"] )
        .pipe( $.uglify() )
        .pipe( $.rev() )
        .pipe( gulp.dest( "./dist/js" ) )
        .pipe( $.rev.manifest( "scripts.json" ) )
        .pipe( gulp.dest( "./dev/rev" ) )
    )

    gulp.task("rev_localeUrls", ->
      gulp.src( ["./dev/rev/locales.json","./dist/js/app-*.js"] )
        .pipe( $.revCollector( replaceReved: true ) )
        .pipe( gulp.dest( "./dist/js/" ) )
    )

    gulp.task("rev_jsUrls", ->
      gulp.src( ["./dev/rev/scripts.json","./dist/index.html"] )
        .pipe( $.revCollector( replaceReved: true ) )
        .pipe( gulp.dest( "./dist/" ) )
        .on("end", ->
          deferred.resolve()
        )
    )

    $.runSequence( "rev_js", "rev_localeUrls", "rev_jsUrls" )

    deferred.promise