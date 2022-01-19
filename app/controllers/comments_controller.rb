class CommentsController < ApplicationController
  def index
  @comments = Comment.all
  @users = User.find(1)
  p "HELLLLLOOOOOO"
  p @users
  end

def create
  @new_comment = Comment.new(comment_params)
  @comment.save
end

private
        def comment_params
          params.require(:content).permit(:content)
        end
    end
