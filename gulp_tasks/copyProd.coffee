shell = require("gulp-shell")

module.exports = (gulp, $) ->

  ->
    gulp.src("")
      .pipe( shell([ "gulp_tasks/scripts/copyProd.sh" ] ) );

