require 'rails_helper'
describe 'UsersControllers', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'Ruby Guy') }

    it 'returns a successful response' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}"
      expect(response.body).to include('Ruby Guy')
    end
  end
end
