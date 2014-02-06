describe "Blog controllers", ->
  beforeEach module("Blog")


  describe "FooCtrl", ->
    it "should have bar in foo", -> 
      scope = {}
      ctrl = FooCtrl(scope)   
      expect(scope.foo).toBe "bar"
