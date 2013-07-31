angular.module('kosynierzy').controller 'TripsCtrl', ['$scope', 'Trips', ($scope, Trips) ->
  Trips.index().success (data) ->
    $scope.trips = data

  $scope.$watch('trips', (new_val, old_val) ->
    $scope.number_of_trips = _.filter($scope.trips, (trip) -> trip.presence).length
  , true)

  $scope.participate = (trip) ->
    trip.presence = true
    Trips.participate(trip)

  $scope.leave = (trip) ->
    trip.presence = false
    Trips.leave(trip)
]
