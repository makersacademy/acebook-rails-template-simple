class CommentsController < ApplicationController
  def index
    @new_comment = Comment.new
    @comments = Comment.all
    # @users = User.find(1)
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

