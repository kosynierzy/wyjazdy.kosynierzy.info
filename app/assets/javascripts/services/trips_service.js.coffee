angular.module('kosynierzy').factory 'Trips', ['$http', ($http) ->
  {
    index: -> $http.get('/trips.json', {isArray: true})
    participate: (trip) -> $http.post(trip.links.presence.href)
    leave: (trip) -> $http.delete(trip.links.absence.href)
  }
]
