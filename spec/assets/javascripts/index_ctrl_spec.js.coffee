describe "Blog controllers", ->
  beforeEach module("Blog")

  describe "IndexCtrl", ->
    it "should have a list of posts", -> 
      scope = {}
      postData = 
      	data: 
      		title: "foo"
      		contents: "bar"
		loadPosts = (deferred) ->

      ctrl = IndexCtrl(scope, null, null, postData)   
      expect(scope.data.posts).toEqual([{title: 'foo', contents: 'bar'}])
