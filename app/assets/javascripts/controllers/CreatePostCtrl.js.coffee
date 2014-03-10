@CreatePostCtrl = ($scope, $location, postData, LocationService) ->

  LocationService.locate().then (position) ->
    $scope.position = position

  $scope.data = postData.data
  postData.loadPosts(null)

  $scope.formData =
    newPostTitle: ''
    newPostContents: ''

  $scope.navNewPost = ->
    $location.url('/post/new')
 
  $scope.navHome = ->
    $location.url('/')

  $scope.createPost = ->
    console.log($scope.position)
    postData.createPost($scope.formData, $scope.position)
    $location.url('/')

  $scope.clearPost = ->
    $scope.formData.newPostTitle = ''
    $scope.formData.newPostContents = ''


@CreatePostCtrl.$inject = ['$scope', '$location', 'postData', 'LocationService']