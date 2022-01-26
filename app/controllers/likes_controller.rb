class LikesController < ApplicationController

  before_action :must_be_logged_in

  before_action :find_post


  def create
    @like = current_user.likes.create(post_id: @post.id)
    do_not_run_js_in_test
  
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @post = Post.find(@like.post_id)
    @like.destroy
    
    do_not_run_js_in_test
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
