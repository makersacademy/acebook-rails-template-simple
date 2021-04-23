require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  
  let!(:users) { create_list(:user, 10) }
  let(:user_id) {users.first.id}

  describe 'GET/users' do
    before { get '/users' }

    it 'returns users' do
  
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET/users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the user exists' do
      it 'returns the user' do
        expect(json).to_not be_empty
        expect(json['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User with 'id'=100/)
      end
    end
  end
  describe 'POST/users' do
    let(:valid_attributes) { {forename: 'bob', surname: 'robertson', username: 'bobrocks', email: 'bob@robert.com', password: 'notbob', profilePic: '' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['forename']).to eq('bob')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { forename: '', password: 'password1' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Forename can't be blank/)
      end
    end
  end
end