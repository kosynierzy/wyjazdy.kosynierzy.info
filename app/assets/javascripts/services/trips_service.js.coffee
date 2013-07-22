angular.module('kosynierzy').factory 'Trips', ['$http', ($http) ->
  {
    index: -> $http.get('/trips.json', {isArray: true})
  }
]
