angular.module('kosynierzy').factory 'Trips', ['$http', ($http) ->
  {
    index: -> $http.get('/trips.json', {isArray: true})
    participate: (id) -> $http.post("/trips/#{id}/presence")
    leave: (id) -> $http.delete("/trips/#{id}/absence")
  }
]
