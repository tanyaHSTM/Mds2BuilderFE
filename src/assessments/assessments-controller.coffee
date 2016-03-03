"use strict"

angular

  .module( "pvdm.assessments" )

  .controller( "assessments.controller", ($scope, Collection, $translate, REGEX) ->

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
          default: '1234567890'
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

        E1a:
          type: 'string'
          title: '(E1a) Negative statements'
          enum: ['0', '1', '2']
          default: '0'

        E1b:
          type: 'string'
          title: '(E1b) Repetitive questions'
          enum: ['0', '1', '2']
          default: '0'

        E1c:
          type: 'string'
          title: '(E1c) Repetitive verbalizations'
          enum: ['0', '1', '2']
          default: '0'

        E1d:
          type: 'string'
          title: '(E1d) Persistent anger with self/others'
          enum: ['0', '1', '2']
          default: '0'

        E1e:
          type: 'string'
          title: '(E1e) Self deprecation'
          enum: ['0', '1', '2']
          default: '0'

        E1f:
          type: 'string'
          title: '(E1f) Expression of unrealistic fears'
          enum: ['0', '1', '2']
          default: '0'

        E1g:
          type: 'string'
          title: '(E1g) Recurrent statements - something terrible'
          enum: ['0', '1', '2']
          default: '0'

        E1h:
          type: 'string'
          title: '(E1h) Repetitive health complaints'
          enum: ['0', '1', '2']
          default: '0'

        E1i:
          type: 'string'
          title: '(E1i) Repetitive anxious complaints'
          enum: ['0', '1', '2']
          default: '0'

        E1j:
          type: 'string'
          title: '(E1j) Unpleasant mood in morning'
          enum: ['0', '1', '2']
          default: '0'

        E1k:
          type: 'string'
          title: '(E1k) Insomnia/change in sleep pattern'
          enum: ['0', '1', '2']
          default: '0'

        E1l:
          type: 'string'
          title: '(E1l) Sad, pained, worried facial expressions'
          enum: ['0', '1', '2']
          default: '0'

        E1m:
          type: 'string'
          title: '(E1m) Crying, tearfulness'
          enum: ['0', '1', '2']
          default: '0'

        E1n:
          type: 'string'
          title: '(E1n) Repetitive physical movements'
          enum: ['0', '1', '2']
          default: '0'

        E1o:
          type: 'string'
          title: '(E1o) Withdrawal from activities of interest'
          enum: ['0', '1', '2']
          default: '0'

        E1p:
          type: 'string'
          title: '(E1p) Reduced social interaction'
          enum: ['0', '1', '2']
          default: '0'

        E4aA:
          type: 'string'
          title: '(E4aA) Wandering frequency'
          enum: ['0', '1', '2']
          default: '0'

    $scope.model = {}
    
    ### CSV ###
    $scope.getHeaders = ->
      for keyName of $scope.model
        key = keyName

    # Populate assesssment table
    $scope.assessments = []

    $scope.addAssessment = ->
      $scope.asseeesmentData = angular.copy($scope.model)
      $scope.assessments.push($scope.asseeesmentData)
    # Csv download bottun actions
    $scope.getCurrentAssessment = [$scope.model]
    $scope.getAssessmentList = $scope.assessments

    return
  )