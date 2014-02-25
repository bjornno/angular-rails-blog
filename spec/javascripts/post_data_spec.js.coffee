describe "PostData", ->
  service = {}
  beforeEach module("Blog")

  beforeEach inject (postData, $httpBackend) ->
    service = postData
    @http = $httpBackend
    @http.when("GET", './posts.json').respond([{foo: 'bar'}])

  describe "posts", ->
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

		it "should POST a new post with correct data", ->
			new_post = 
				newPostTitle: "foo"
				newPostContents: "bar"

			post_data =
				new_post:
					title: new_post.newPostTitle 
					contents: new_post.newPostContents

			@http.expect('POST', './posts.json', post_data).respond(201, new_post)
			service.createPost(new_post)
			@http.flush()

		it "should DELETE when delete", ->
			@http.expect('DELETE', './posts/1').respond(204)
			service.deletePost(1)
			@http.flush()
						
 