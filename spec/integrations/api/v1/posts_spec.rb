# spec/integrations/api/v1/posts_spec.rb

require 'swagger_helper'

describe "Api::V1::PostsController", type: :request do
  path "/api/v1/users/{user_id}/posts" do
    parameter name: "user_id", in: :path, type: :integer, required: true

    get "Retrieves a list of posts for a user" do
      tags "Posts"
      produces "application/json"
      parameter name: "Authorization", in: :header, type: :string, required: true

      response "200", "Returns a list of posts" do
        let!(:user) { create(:user) }
        let!(:posts) { create_list(:post, 5, user: user) }
        let(:user_id) { user.id }
        let(:Authorization) { "Bearer your_auth_token" }

        run_test!
      end

      response "404", "User not found" do
        let(:user_id) { 9999 }
        let(:Authorization) { "Bearer your_auth_token" }

        run_test!
      end
    end
  end
end