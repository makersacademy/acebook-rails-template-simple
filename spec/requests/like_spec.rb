require 'rails_helper'

RSpec.describe 'Likes API', type: :request do

  let!(:users) { create_list(:user, 10) }
  let!(:posts) { create_list(:post, 10) }
  let!(:like) { create_list(:like, 1) }
  let(:like_id) { like.first.id }

  describe 'GET/likes' do
    before { get '/likes'}

    it 'returns likes' do
      expect(json).not_to be_empty
      expect(json.size).to eq 1
    end
    it 'returns status code 200' do
      expect(response).to have_http_status 200
    end
  end

  describe 'GET/likes/:id' do
    before { get "/likes/#{like_id}" }

    context 'when the like exists' do
      it 'returns the like' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(like_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status 200
      end
    end

    context 'when the like does not exist' do
      let(:like_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Like with 'id'=100/)
      end
    end

end
xdescribe 'POST/posts' do
  let(:valid_attributes) { {content: "oh wow 250 characters", user_id: '1'} }

  context 'when the request is valid' do
    before { post '/posts', params: valid_attributes }

    it 'creates a post' do
      expect(json['content']).to eq("oh wow 250 characters")
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  context 'when the request is invalid' do
    before { post '/posts', params: { content: '', user_id: '1' } }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(response.body).to match(/Validation failed: Content can't be blank/)
    end
  end
end
end
