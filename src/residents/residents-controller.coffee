"use strict"

angular

  .module( "pvdm.residents" )

  .controller( "residents.controller", ($scope) ->

    $scope.schema =
      type: 'object'
      properties:
        name:
          type: 'string'
          minLength: 2
          title: 'Name'
          description: 'Name or alias'
        title:
          type: 'string'
          enum: ['dr', 'jr', 'sir', 'mrs', 'mr']
    $scope.form = [
      '*'
      {
        type: 'submit'
        title: 'Save'
      }
    ]
    $scope.model = {}

    $scope.getArray = [$scope.model]

    return
  )