"use strict"

angular

  .module( "pvdm.residents" )

  .controller( "residents.controller", ($scope, $translate, REGEX) ->

    $scope.REGEX = REGEX

    # Schema Form
    $scope.schema =
      type: 'object'
      properties:

        Master_no:
          type: 'string'
          title: '(Master_no) Master no. from CCIM'
          default: '1234'
          minLength: 4
          maxLength: 4
          pattern: REGEX.NUMERIC
          validationMessage: "Must be 4 digits"

        Resident_identifier:
          type: 'string'
          title: '(Resident_identifier) 10 digit resident identifier'
          default: '123456789'
          minLength: 10
          maxLength: 10
          pattern: REGEX.NUMERIC
          validationMessage: "Must be 10 digits"

        AA7:
          type: 'string'
          title: '(AA7) Admission Type'
          enum: ['0','9']
          default: '0'

        AA8:
          type: 'string'
          title: '(AA8) Reason For Assessment'
          enum: ['1', '2', '3', '4', '5', '10']
          default: '3'

        AA9:
          type: 'string'
          title: '(AA9) Discharge Type'
          enum: ['6', '7', '8']
          default: '6'

        AB1:
          type: 'string'
          title: '(AB1) Admission/Re-entry date'
          default: "20140101"
          minLength: 8
          maxLength: 8
          pattern: REGEX.NUMERIC
          validationMessage: "Format must be yyyymmdd"

        A3:
          type: 'string'
          title: '(A3) Assessment Reference Date'
          default: "20150202"
          minLength: 8
          maxLength: 8
          pattern: REGEX.NUMERIC
          validationMessage: "Format must be yyyymmdd"

        B1:
          type: 'string'
          title: '(B1) Comatose'
          enum: ['0', '1']
          default: '0'

        B2a:
          type: 'string'
          title: '(B2a) Short term memory OK'
          enum: ['0', '1']
          default: '0'

        B4:
          type: 'string'
          title: '(B4) Cognitive Skills for Daily Decision Making'
          enum: ['0', '1', '2', '3']
          default: '0'

        C4:
          type: 'string'
          title: '(C4) Making Self Understood'
          enum: ['0', '1', '2', '3']
          default: '0'

    $scope.model = {}
    
    # CSV
    $scope.getHeader = ->
      [
        'Master_no'
        'Resident_identifier'
        'AA7'
        'AA8'
        'AA9'
        'AB1'
        'A3'
        'B1'
        'B2a'
        'B4'
        'C4'
      ]

    $scope.getArray = [$scope.model]

    return
  )