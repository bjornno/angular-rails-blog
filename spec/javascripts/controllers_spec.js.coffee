describe "Blog controllers", ->
  beforeEach module("Blog")


  describe "EditPostCtrl", ->
    it "should have bar in foo", -> 
      scope = {}
      ctrl = EditPostCtrl(scope)   
      expect(scope.foo).toBe "bar"
