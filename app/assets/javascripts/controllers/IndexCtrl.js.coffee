@IndexCtrl = ($scope, $q, $location, $http, postData, LocationService) ->

  LocationService.locate().then (position) ->
    $scope.location = position
    $scope.distance = LocationService.distanceBetweenPoints(position.coords.latitude, position.coords.longitude, 59.9500, 10.7500).toFixed(2)

  $scope.data = postData.data

  postData.loadPosts(null)

  $scope.viewPost = (postId) ->
    $location.url('/post/'+postId)

  $scope.navNewPost = ->
    $location.url('/post/new')

@IndexCtrl.$inject = ['$scope', '$q', '$location', '$http', 'postData', 'LocationService']