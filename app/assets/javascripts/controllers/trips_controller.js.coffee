angular.module('kosynierzy').controller 'TripsCtrl', ['$scope', 'Trips', ($scope, Trips) ->
  Trips.index().success (data) ->
    $scope.trips = data

  $scope.participate = (trip) ->
    trip.presence = true
    Trips.participate(trip)

  $scope.leave = (trip) ->
    trip.presence = false
    Trips.leave(trip)
]
