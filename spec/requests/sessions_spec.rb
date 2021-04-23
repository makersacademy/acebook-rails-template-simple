require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do


  describe 'POST/posts' do
    let(:valid_attributes) { { forename: 'Sadie', 
                                surname: 'Smith',
                                username: 'Ssmith',
                                email: 'ssmith@notadomain.com',
                                password: 'password1',
                                profilePic: '' } }
    
    before { post '/users', params: valid_attributes }
                            
    context 'when the user is valid' do
      before { post '/login', params: { user:  { username: 'Ssmith', password: 'password1' } } }
      
      it 'return status code 200' do
        expect(json['logged_in']).to be(true)
      end

      it 'returns the user' do
        expect(json['user']['forename']).to eq('Sadie')
      end
    end
  end
end

