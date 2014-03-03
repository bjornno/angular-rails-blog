require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "renders posts as json" do
      current_user = {}
    	post_data = {title: "foo", contents: "bar"}
      team = Post.create post_data
      get :index, :format => :json
      response.should be_success
      parsed_body = JSON.parse(response.body)
      parsed_body.length.should == 1
      parsed_body.first["title"].should == "foo" 
    end
  end

end