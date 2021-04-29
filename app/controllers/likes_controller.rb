class LikesController < ApplicationController
  def index
    @likes = Like.all
    json_response(@likes)
  end

  def create
    @likes = Like.create!(like_params)
    json_response(@likes, :created)
  end

  def delete
  end

  def show
    @like = Like.find(params[:id])
    json_response(@like)
  end

  private

  def like_params
    params.permit(:post_id, :user_id)
  end
end
