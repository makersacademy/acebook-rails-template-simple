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
  end
end
