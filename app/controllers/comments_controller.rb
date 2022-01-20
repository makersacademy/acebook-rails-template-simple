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
  end

  def post_check
    if @comments.posts_id == @post
    end
  end

def create
  @new_comment = Comment.create(content: comment_params[0])
  redirect_to '/comments'
end

def post_picture
  @post_pic = Post.create!(post_params)
  @post.picture.attach(io: File.open('app/assets/images/spiderman.jpg'), filename: 'spiderman.jpg', content_type: 'image/jpg')
    redirect_to '/comments'
end

private
        def comment_params
          params.require([:content])
        end

        def post_params
          params.require(:post).permit(:picture)
        end
    end

