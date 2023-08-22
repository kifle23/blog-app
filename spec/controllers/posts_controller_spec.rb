require 'rails_helper'
describe PostsController, type: :request do
    describe '#index' do
      it 'returns a successful response' do
        get '/users/1/posts' 
        expect(response).to have_http_status(:success)
      end
    end
end