module.exports = (gulp, $) ->

  ->

    deferred = $.q.defer()

    gulp.task("rev_images", -> 
      gulp.src( ["./dev/img/*.{png,gif,jpg,svg}"] )
        .pipe( $.rev() )
        .pipe( gulp.dest( "./dist/img" ) )
        .pipe( $.rev.manifest( "images.json" ) )
        .pipe( gulp.dest( "./dev/rev" ) )
    )

    gulp.task("rev_cssImageUrls", ->
      gulp.src( ["./dev/rev/images.json", "./dist/css/styles-*.css"] )
        .pipe( $.revCollector( replaceReved: true ) )
        .pipe( gulp.dest( "./dist/css" ) )
    )

    gulp.task("rev_jsImageUrls", ->
      gulp.src( ["./dev/rev/images.json", "./dist/js/app-*.js"] )
        .pipe( $.revCollector( replaceReved: true ) )
        .pipe( gulp.dest( "./dist/js" ) )
        .on("end", ->
          deferred.resolve()
        )
    )

    $.runSequence( "rev_images", "rev_cssImageUrls", "rev_jsImageUrls" )

    deferred.promise