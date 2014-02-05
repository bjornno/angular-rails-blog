describe "R controllers", ->
  #beforeEach module("???")

  describe "PostCtrl", ->
    it "should ...", inject(($controller) ->
      scope = {}
      ctrl = $controller("PostCtrl",
        $scope: scope
      )
      expect(scope.data.length).toBe 0
    )