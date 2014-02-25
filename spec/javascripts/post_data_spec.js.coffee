describe "PostData", ->
  service = {}
  beforeEach module("Blog")

  beforeEach inject (postData, $httpBackend) ->
    service = postData
    @http = $httpBackend
    @http.when("GET", './posts.json').respond([{foo: 'bar'}])

  describe "load posts", ->
    it "should initially not have loaded data", -> 
    	expect(service.isLoaded).toEqual(false)

    it "should set loaded after loading data", ->
    	service.loadPosts(null) 
    	@http.flush()
    	expect(service.isLoaded).toEqual(true)

    it "should have some posts after loading", ->
    	service.loadPosts(null) 
    	@http.flush()
    	expect(service.data.posts).toEqual([{foo: 'bar'}])
 