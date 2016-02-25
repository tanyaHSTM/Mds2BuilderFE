config = require("./config.json")
postcss = require("gulp-postcss")
sass = require("gulp-sass")

module.exports = (gulp, $) ->

  ->

    deferred = $.q.defer()

    bootstrap = ->
      gulp.src([
        "./lib/stylesheets/pvdm-bootstrap/bootstrap.css"
      ])

    lib = ->
      gulp.src([
        "./lib/stylesheets/pvdm-bootstrap/bootstrap-overrides/**/*.scss",
        "./lib/components/**/*.scss"
      ])

    appComponents = ->
      gulp.src([
        "./src/**/*.scss",
        "!./src/common/stylesheets/**/*.scss"
      ])

    temp = ->
      gulp.src([
        "./src/common/stylesheets/temporary.scss"
      ])

    $.eventStream.merge( bootstrap(), lib(), appComponents(), temp() )
      .pipe( $.concat( "styles.css" ) )
      .pipe(
        sass().on("error", sass.logError)
      )
      .pipe(
        postcss([
#           require('precss')(),
          require('autoprefixer')({
            browsers: ['ie > 9', 'ff > 10', 'Chrome > 20']
          }) 
        ])
      )
      .pipe( gulp.dest('./dev/css') )
      .on("end", ->
        deferred.resolve()
      )

    deferred.promise
