config = require("./config.json")

module.exports = (gulp, $) ->

  ->
    templates = ->
      gulp.src( ["./src/**/*.html", "./lib/components/**/*.html"] )
        .pipe( $.changed( "./dev/js" ) )
        .pipe( $.flatten() )
        .pipe(
          $.htmlmin(
            collapseWhitespace: true
            removeComments: true
            removeAttributeQuotes: true
          )
        )
        .pipe( $.angularTemplatecache() )

    coffee = ->
      gulp.src( ["./src/**/*module.coffee", "./lib/**/*module.coffee", "./lib/**/*.coffee", "./src/**/*.coffee"] )
        .pipe( $.changed( "./dev/js" ) )
        .pipe( $.coffee() )
        .pipe( $.ngAnnotate() )

    $.eventStream.merge( templates(), coffee() )
      .pipe( $.concat( "app.js" ) )
      .pipe( gulp.dest( "./dev/js" ) )
