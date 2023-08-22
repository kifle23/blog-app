require 'rails_helper'

describe 'UsersControllers', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      allow(User).to receive(:all).and_return([])
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      allow(User).to receive(:all).and_return([])
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      allow(User).to receive(:all).and_return([User.new(name: 'Tom')])
      get '/users'
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      allow(User).to receive(:find).and_return(User.new(name: 'Ruby Guy'))
      get '/users/1'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      allow(User).to receive(:find).and_return(User.new(name: 'Ruby Guy'))
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      allow(User).to receive(:find).and_return(User.new(name: 'Ruby Guy'))
      get '/users/1'
      expect(response.body).to include('Ruby Guy')
    end
  end
end
