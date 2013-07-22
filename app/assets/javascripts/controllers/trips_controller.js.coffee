angular.module('kosynierzy').controller 'TripsCtrl', ['$scope', 'Trips', ($scope, Trips) ->
  Trips.index().success (data) ->
    $scope.trips = data
]
