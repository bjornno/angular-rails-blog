#@Blog.controller 'TestCtrl', ['$scope', ($scope) -> 
@TestCtrl = ($scope) ->
  $scope.foo = 'bar'


@CTestCtrl.$inject = ['$scope']