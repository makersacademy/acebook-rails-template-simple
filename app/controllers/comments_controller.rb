class CommentsController < ApplicationController
  def index
    @new_comment = Comment.new
    @comments = Comment.all
    @test_posts = Post.all
    @users = User.all
   p @post1 = Post.find(1).id
    @post2 = Post.find(2).id
  end

  def post_check
    if @comments.posts_id == @post
    end
  end

def create
  p "TESTING COMMENTS"
  p comment_params[0]
  @new_comment = Comment.create(content: comment_params[0])
  redirect_to '/comments'
end

private
        def comment_params
          p "BEFORE COMMENT PARAMS"
          params.require([:content])
        end
    end

