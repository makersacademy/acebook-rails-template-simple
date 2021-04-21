require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST /posts/:post_id/comments" do

    it "creates a comment" do
      post :create, params: { comment: { user: "1", body: "Test", post: "1"} }
      expect(Comment.find_by(post_id: "1")).to be
    end
  end
end


# comments#index
# POST   /posts/:post_id/comments(.:format)                                                                comments#create
# new_post_comment GET    /posts/:post_id/comments/new(.:format)                                                            comments#new
# edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format)                                                       comments#edit
# post_comment GET    /posts/:post_id/comments/:id(.:format)                                                            comments#show
# PATCH  /posts/:post_id/comments/:id(.:format)                                                            comments#update
# PUT    /posts/:post_id/comments/:id(.:format)                                                            comments#update
# DELETE /posts/:post_id/comments/:id(.:format)                                                            comments#destroy
# posts GET    /posts(.:format) 