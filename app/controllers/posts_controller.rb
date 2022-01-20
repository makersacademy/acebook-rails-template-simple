class PostsController < ApplicationController

  def index
    @picture_posts = Post.all.with_attached_images
  end

  def create
    picture_post = Post.create! params.require(:content).permit(:image)
    picture_post.images.attach(params[:content][:images])
    redirect_to '/comments'
  end


 def show
  @picture_post = Post.find(params[:id])
 end
end


# def create
#   post_params = params.require(:content).permit(:image)
#   @picture_post = Post.create(post_params)
#   if @picture_post.valid?
#     redirect_to '/comments'
#   else
#     flash[:errors] = @picture_post.errors.full_messages
#     redirect_to '/comments'
#   end
#  end