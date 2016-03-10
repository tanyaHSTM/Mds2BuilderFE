"use strict"

angular

  .module( "pvdm.assessments" )

  .controller( "assessments.controllers.collection", ( $filter, Collection, schemaBuilder, formBuilder) ->
    
    vm = @
    vm.schema = schemaBuilder
    vm.form = formBuilder
    vm.model = {}
    # Assessments
    vm.assessments = []
    vm.assessments = new Collection(vm.assessments, 'Resident_identifier', reverse=true)

    vm.addAssessment = ->
      vm.assessmentData = angular.copy(vm.model)
      vm.assessments.add(vm.assessmentData)
    # Navigation
    vm.singlePage = true
    vm.batch = false  

    vm.viewBatch = ->
      vm.singlePage = false
      vm.batch = true

    vm.viewSinglePage = ->
      vm.singlePage = true
      vm.batch = false
    # Table
    vm.resetTable = ->
      vm.assessments.clear()

    vm.setAsssessment = (assessmentId) ->
      vm.assessmentId = assessmentId
      vm.model = vm.assessments.records[vm.assessmentId]

    # Batch
    vm.num_residents = "1"

    vm.assessmentType = 
      admission : true
      quarterly : false
      annual : false
      discharge : false

    vm.populateTable = (unq_res) ->
      n = 1
      while n <= unq_res
        resId = Math.random().toString().slice(2,12)
        vm.model.Resident_identifier = resId
        if vm.assessmentType.admission == true
          vm.model.AA8 = "01"
          vm.model.AA9 = ""
          vm.model.AB1 = $filter('daysAgoFormatted')(10)
          vm.addAssessment()
        if vm.assessmentType.quarterly == true
          vm.model.AA8 = "05"
          vm.model.AA9 = ""
          vm.model.AB1 = $filter('daysAgoFormatted')(15)
          vm.addAssessment()
        if vm.assessmentType.annual == true
          vm.model.AA8 = "02"
          vm.model.AA9 = ""
          vm.model.AB1 = $filter('daysAgoFormatted')(20)
          vm.addAssessment()
        if vm.assessmentType.discharge == true
          vm.model.AA8 = "01"
          vm.model.AA9 = "06"
          vm.model.AB1 = $filter('daysAgoFormatted')(25)
          vm.addAssessment()
        n++
    
    ### CSV ###
    vm.filename = "3333333333_CCIM_20160224.csv"
    
    vm.getHeaders = ->
      for keyName of vm.model
        key = keyName

    # Csv download
    vm.getAssessmentList = vm.assessments

    return
  )