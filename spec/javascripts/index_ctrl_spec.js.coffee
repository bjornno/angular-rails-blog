describe "Blog controllers", ->
  beforeEach module("Blog")

  describe "IndexCtrl", ->
    it "should run", -> 
      scope = {}
      postData = 
      	data: {}
		loadPosts = (deferred) ->

      ctrl = IndexCtrl(scope, null, null, postData)   
      expect(true).toBe true
