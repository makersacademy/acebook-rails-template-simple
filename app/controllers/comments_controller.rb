class CommentsController < ApplicationController
  def index
   @comments = Comment.all
   @users = User.all
  end
end
