# require 'rails_helper'

# RSpec.describe PostsController, type: :controller do
#   describe "GET /new " do
#     it "responds with 200" do
#       get :new
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "POST /posts" do
#     it "responds with 302" do
#       post :create, params: { post: { message: "Hello, world!", user_id: 11} }
#       expect(response).to have_http_status(302)
#       expect(response).to redirect_to(posts_url)
#     end

#     it "creates a post" do
#       post :create, params: { post: { message: "Hello, world!", user_id: 11 } }
#       expect(Post.find_by(message: "Hello, world!")).to be
#     end
#   end

#   describe "GET /" do
#     it "responds with 200" do
#       get :index
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "PATCH /" do
#     it "method patch,route /post/:id/edit to update action" do
#       post :create, params: { post: { message: "Hello, world!" } }
#       @post = Post.find_by(message: "Hello, world!")
#       expect(patch: "/posts/#{@post.id}").to route_to("posts#update", "id"=>"#{@post.id}")
#     end
#   end

#   describe "DELETE /" do
#     it "method delete,route /post/:id to destroy action" do
#       post :create, params: { post: { message: "We're on rails!" } }
#       @post = Post.find_by(message: "We're on rails!")
#       expect(delete: "/posts/#{@post.id}").to route_to("posts#destroy", "id"=>"#{@post.id}")
#     end
#   end
# end
