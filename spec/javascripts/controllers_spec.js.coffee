describe "R controllers", ->
  #beforeEach module("???")

  describe "TestCtrl", ->
    it "should have no data", inject(($controller) ->
      scope = {}
      ctrl = $controller("TestCtrl",
        $scope: scope
      )
      expect(scope.foo).toBe "bar"
    )