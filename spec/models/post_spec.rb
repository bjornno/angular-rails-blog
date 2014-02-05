require 'spec_helper'

describe Post do
  before do
    @post = Post.new(title: "Momofuku", contents: "fofoofo")
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should be_valid }

  describe "when title is not present" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "when contents is not present" do
    before { @post.contents = " " }
    it { should_not be_valid }
  end

end