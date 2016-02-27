require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "If title is there and body is long enought" do
    post = Post.new(:title => "Some title", :body => "Some body longer than ten")
    assert post.valid?
  end
end
