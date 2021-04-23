require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  let!(:users) { create_list(:user, 10) }
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first.id }

  describe 'GET/posts' do
    before { get '/posts'}

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/posts/:id' do
    before { get "/posts/#{post_id}" }

    context 'when the post exists' do
      it 'returns the post' do
        expect(json).to_not be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the post does not exist' do
      let(:post_id) { 100 }

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post with 'id'=100/)
      end
    end
  end

  describe 'POST/posts' do
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