
# Init gulp
# ----------------------------------------------

gulp = require( "gulp" )
$ = require( "gulp-load-plugins" )()

# Load misc plugins
# ----------------------------------------------

$.path = require("path")
$._ = require("lodash")
$.runSequence = require("run-sequence")
$.eventStream = require("event-stream")
$.del = require("del")
$.vinylPaths = require("vinyl-paths")
$.q = require("q")

# Config file
# ----------------------------------------------

config = require("./gulp_tasks/config.json")

# Function to get task files
# ----------------------------------------------

getTask = (task) ->
  require( "./gulp_tasks/#{task}" )( gulp, $ )

# Development Tasks
# ----------------------------------------------

# Clean out ./dev
gulp.task( "clean", getTask("clean") )

# Copy index
gulp.task( "index", getTask("index") )

# Copy fonts
gulp.task( "fonts", getTask("fonts") )

# Copy Images
gulp.task( "images", getTask("images") )

# Copy Locales
gulp.task( "locales", getTask("locales") )

# Process SASS and concat css
gulp.task( "css", getTask("css") )

# Concat vendor js
gulp.task( "vendorJs", getTask("vendorJs") )

# Process CoffeeScript and concat app js
gulp.task( "appJs", getTask("appJs") )

# Dev build only
gulp.task( "default", (cb) ->
  $.runSequence("clean",[
    "index",
    "fonts",
    "images",
    "locales",
    "css",
    "vendorJs",
    "appJs"], cb)
)

# Dev build & watch
# ----------------------------------------------
gulp.task( "watch", ["default"], ->
  #gulp.watch( ["./src/index.html"], ["index"] )
  gulp.watch( ["./src/**/{en-us,en-ca,fr-ca,es-mx}.json"], ["locales"] )
  gulp.watch( ["./src/**/*.{png,gif,jpg,svg}"], ["images"] )
  gulp.watch( ["./src/**/*.scss", "./lib/styles/**/*.scss", "./lib/**/*.scss"], ["css"] )
  gulp.watch( config.vendor_js, ["vendorJs"] )
  gulp.watch( ["./src/**/*.coffee", "./lib/**/*.coffee"], ["appJs"] )
  gulp.watch( ["./src/**/*.html", "./lib/**/*.html"], ["appJs"] )
)

# Production Tasks
# ----------------------------------------------

# NOTE: order is important for the production build
# process. For example, index.html must be present in
# /dist before the resource urls for js/css may be
# rewritten etc.

# NOTE: As a general rule, avoid running the tasks
# below which are prepended with "_" and only call
# "prod" directly

# NOTE: Changes are not auto compiled for production,
# You will need to run "prod" again after any changes
# if you wish to view them in production mode

# Clean out ./prod
gulp.task( "cleanProd", getTask("cleanProd") )

# Copy index
gulp.task( "_indexProd", getTask("indexProd") )

# Revision & minify CSS
# Rewrite css urls in index.html
gulp.task( "_revCss", getTask("revCss") )

# Revision & minify JS
# Rewrite js urls in index.html
gulp.task( "_revJs", getTask("revJs") )

# Revision Images
# Rewrite images urls in styles-[hash].css
gulp.task( "_revImages", getTask("revImages") )

# Revision fonts
# Rewrite font urls in styles-[hash].css
gulp.task( "_revFonts", getTask("revFonts") )

# Revision Locales
gulp.task( "_revLocales", getTask("revLocales") )

# Production build
# ----------------------------------------------

gulp.task( "prod", ["default"], (cb)->
  $.runSequence(
    "cleanProd",
    "_indexProd",
    "_revLocales",
    "_revCss",
    "_revFonts",
    "_revJs",
    "_revImages",
    "copyProd",
    cb
  )
)
