require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      allow(User).to receive(:all).and_return([])
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      allow(User).to receive(:all).and_return([])
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @users with all users' do
      users = [User.new(name: 'Tom')]
      allow(User).to receive(:all).and_return(users)
      get :index
      expect(assigns(:users)).to eq(users)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      user = User.new(name: 'Ruby Guy')
      allow(User).to receive_message_chain(:includes, :find).and_return(user)
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      user = User.new(name: 'Ruby Guy')
      allow(User).to receive_message_chain(:includes, :find).and_return(user)
      get :show, params: { id: 1 }
      expect(response).to render_template(:show)
    end

    it 'assigns @user with the correct user' do
      user = User.new(name: 'Ruby Guy')
      allow(User).to receive_message_chain(:includes, :find).and_return(user)
      get :show, params: { id: 1 }
      expect(assigns(:user)).to eq(user)
    end
  end
end
