require 'rails_helper'


RSpec.describe Comment, type: :model do
  post = Post.new(message: "This is a post")
  post.save

  it "allows a user to submit a comment" do
    comment = Comment.new(content: "This is my first comment", post_id: post.id)
    comment.save
    expect(comment).to be_valid
  end 

  it "prevents a user from submitting an empty comment on a post" do
    comment = Comment.new(content: "", post_id: post.id)
    expect(comment).to_not be_valid
  end

end


