module Api
  module V1
    class PostsController < ApiController

      def index
        posts = Post.all
        render json: {status: 'SUCCESS', message: 'Loaded posts', data:posts },status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded posts', data:post },status: :ok
      end

      def create
        @user = User.find_by(id: 1)
        post = @user.posts.create(message: params[:message])

        redirect_to posts_url
      end

    end
  end
end