module Api
  module V1
    class SignUpsController < ApiController

      def index
        users = User.all
        render json: {status: 'SUCCESS', message: 'Loaded posts', data:users },status: :ok
      end

    end
  end
end