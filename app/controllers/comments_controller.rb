class CommentsController < ApplicationController
  def index
   @comments = Comment.all
  p @users = User.find(1)
  p @chris = @users.name
  end
end

def show
end

def new
  @new_comment = @comments.build(params[:comment])
end

def edit
end

end