require 'rails_helper'
describe "UsersControllers", type: :request do
    describe "GET #index" do
      it "returns a successful response" do
        get '/users'
        expect(response).to have_http_status(:success)
      end
    end
end