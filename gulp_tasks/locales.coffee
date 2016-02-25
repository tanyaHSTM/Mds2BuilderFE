config = require("./config.json")

module.exports = (gulp, $) ->

  ->

    deferred = $.q.defer()

    streamsDone = 0
    for locale in config.locales
      fileName = "#{locale}.json"
      gulp.src( "./src/**/#{locale}.json" )
        .pipe( $.concat( {path:fileName, cwd:"./"}, {newLine:","} ) )
        .pipe( $.wrap("{ <%= contents %> }", {}, {parse:false}) )
        .pipe( gulp.dest( "./dev/locales" ) )
        .on('end', (stream) ->
          ++streamsDone
          if streamsDone >= config.locales.length
            deferred.resolve()
        )

    deferred.promise