class CommentsController < ApplicationController

  def initialize
   @post = Post.new
  end

  def index
    @new_comment = Comment.new
    @comments = Comment.all
    @test_posts = Post.all
    @users = User.all
    @post1 = Post.find(1).id
    @post2 = Post.find(2).id
    @picture_posts = Post.all.with_attached_image
  end

  def post_check
    if @comments.posts_id == @post
    end
  end

def create
  @new_comment = Comment.create(content: comment_params[0])
  picture_post = Post.create! params.require(:content).permit(:image)
  picture_post.images.attach(params[:content][:images])
  redirect_to '/comments'
end

def show
  @picture_post = Post.find(params[:id])
 end

private
        def comment_params
          params.require([:content]).permit(:image)
        end
    end