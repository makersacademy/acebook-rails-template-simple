class LikesController < ApplicationController
  def index
    @likes = Like.all
    json_response(@likes)
  end

  def create
  end

  def delete
  end

  def show
    @like = Like.find(params[:id])
    json_response(@like)
  end
end
