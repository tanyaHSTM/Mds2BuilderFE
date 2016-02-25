module.exports = (gulp, $) ->

  ->

    # Vendor css stream
    vendorCss = ->
      #gulp.src( config.stylesheets.vendor )
      gulp.src( "./src/common/stylesheets/vendor.scss" )

    # Settings css stream
    settingsCss = ->
      gulp.src( "./src/common/stylesheets/settings.scss" )

    # Utilities css stream
    utilitiesCss = ->
      gulp.src( "./src/common/stylesheets/utilities.scss" )

    # Base css stream
    baseCss = ->
      gulp.src( "./src/common/stylesheets/base.scss" )

    # Component css stream
    componentCss = ->
      gulp.src( "./src/common/components/**/pvdm-*.scss" )

    # Temporary css stream
    temporaryCss = ->
      gulp.src( "./src/common/stylesheets/temporary.scss" )

    # build app stylesheet
    $.eventStream.merge( vendorCss(), settingsCss(), utilitiesCss(), baseCss(), componentCss(), temporaryCss() )
      .pipe( $.changed( "./dev/css" ) )
      .pipe( $.concat( "styles.scss" ) )
      .pipe($.sass({
        errLogToConsole: true
      }))
      .pipe( $.stylestats() )

