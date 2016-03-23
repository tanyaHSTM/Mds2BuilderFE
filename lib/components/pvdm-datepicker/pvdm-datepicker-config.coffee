'use strict'

angular

  .module( 'pvdm.datepicker' )

  .config( (uibDatepickerConfig, uibDatepickerPopupConfig) ->

    #
    # Global datepicker config
    angular.extend(uibDatepickerPopupConfig,
      datepickerPopup: 'MMM d, yyyy'
      showButtonBar: false
#       datepickerTemplateUrl: 'pvdm-datepicker.html'
#       datepickerPopupTemplateUrl: 'pvdm-datepicker-popup.html'
      # Defaults (0.14.3)
      # --------------------------------------
      # datepickerPopup: 'yyyy-MM-dd',
      # datepickerPopupTemplateUrl: 'template/datepicker/popup.html',
      # datepickerTemplateUrl: 'template/datepicker/datepicker.html',
      # html5Types: {
      #   date: 'yyyy-MM-dd',
      #   'datetime-local': 'yyyy-MM-ddTHH:mm:ss.sss',
      #   'month': 'yyyy-MM'
      # },
      # currentText: 'Today',
      # clearText: 'Clear',
      # closeText: 'Done',
      # closeOnDateSelection: true,
      # appendToBody: false,
      # showButtonBar: true,
      # onOpenFocus: true
    )
    angular.extend(uibDatepickerConfig,
      formatDay: 'd'
      showWeeks: false
      # Defaults (0.14.3)
      # --------------------------------------
      # formatDay: 'dd',
      # formatMonth: 'MMMM',
      # formatYear: 'yyyy',
      # formatDayHeader: 'EEE',
      # formatDayTitle: 'MMMM yyyy',
      # formatMonthTitle: 'yyyy',
      # datepickerMode: 'day',
      # minMode: 'day',
      # maxMode: 'year',
      # showWeeks: true,
      # startingDay: 0,
      # yearRange: 20,
      # minDate: null,
      # maxDate: null,
      # shortcutPropagation: false
    )

  )
