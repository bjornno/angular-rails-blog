describe "Blog controllers", ->
  beforeEach module("Blog")

  describe "TestCtrl", ->
    it "should have no data", inject(($controller) ->
      scope = {}
      ctrl = $controller("TestCtrl",
        $scope: scope
      )
      expect(scope.foo).toBe "bar"
    )