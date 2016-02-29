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
          title: 'Master_no'
          description: 'Master no from CCIM'
          minLength: 4
          maxLength: 4
          default: "1234"
          pattern: REGEX.NUMERIC
          validationMessage: "Must be 4 digits"

        Resident_identifier:
          type: 'string'
          title: 'Resident_identifier'
          description: '10 digit resident identifier'
          minLength: 10
          maxLength: 10
          default: "123456789"
          pattern: REGEX.NUMERIC
          validationMessage: "Must be 10 digits"

        AA7:
          type: 'string'
          title: 'AA7'
          description: 'Admission Type'
          enum: ['0','9']
          default: '0'

    $scope.model = {}
    
    # CSV
    $scope.getHeader = ->
      [
        'Master_no'
        'Resident_identifier'
        'AA7'
      ]
    $scope.getArray = [$scope.model]

    return
  )