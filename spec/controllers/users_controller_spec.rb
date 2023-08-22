require 'rails_helper'
describe "UsersControllers", type: :request do
    describe "GET #index" do
      it "returns a successful response" do
        get '/users'
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        get '/users'
        expect(response).to render_template(:index)
      end
    end
end