"use strict"

angular

  .module( "pvdm.assessments.dqi" )

  .controller( "dqi.controllers.collection", ( $filter, Collection, DqiSchema, ASSESSMENT_TYPE) ->
    
    vm = @
    vm.schema = DqiSchema.schema
    vm.form = DqiSchema.form
    vm.model = DqiSchema.model
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
          $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.ADMISSION)
          vm.addAssessment()
        if vm.assessmentType.quarterly == true
          $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.QUARTERLY)
          vm.addAssessment()
        if vm.assessmentType.annual == true
          $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.ANNUAL)
          vm.addAssessment()
        if vm.assessmentType.discharge == true
          $filter('assessmentType')(vm.model, ASSESSMENT_TYPE.DISCHARGE)
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
