angular.module('Blog').factory('postData', ['$http', ($http) ->

  postData =
    data:
      posts: [{title: 'Loading', contents: '', position: ''}]
    isLoaded: false

  postData.loadPosts = (deferred) ->
    if !postData.isLoaded
      $http.get('./posts.json').success( (data) ->
        postData.data.posts = data
        postData.isLoaded = true
        console.log('Successfully loaded posts.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load posts.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()


  postData.createPost = (newPost, position) ->
    # Client-side data validation
    if newPost.newPostTitle == '' or newPost.newPostContents == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_post:
        title: newPost.newPostTitle
        contents: newPost.newPostContents
        position: position

    # Do POST request to /posts.json
    $http.post('./posts.json', data).success( (data) ->
      
      # Add new post to array of posts
      postData.data.posts.push(data)
      console.log('Successfully created post.')

    ).error( ->
      console.error('Failed to create new post.')
    )

    return true

  postData.deletePost = (id) -> 
    $http.delete('./posts/'+id).success( (data) ->
      console.log('Successfully deleted post')
    ).error( ->
      console.error('Failed to delete post')
    ) 
    postData.isLoaded = false
    
  return postData
])