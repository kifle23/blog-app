# spec/requests/api/v1/comments_spec.rb
# rubocop:disable Metrics/BlockLength

require 'swagger_helper'

describe 'Api::V1::CommentsController', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :integer, required: true
    parameter name: 'post_id', in: :path, type: :integer, required: true

    get 'Retrieves comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, required: true

      response '200', 'Returns a list of comments' do
        let!(:user) { create(:user) }
        let!(:post) { create(:post, user:) }
        let!(:comments) { create_list(:comment, 5, post:) }
        let(:user_id) { user.id }
        let(:post_id) { post.id }
        let(:Authorization) { 'Bearer your_auth_token' }

        run_test!
      end

      response '404', 'User or post not found' do
        let(:user_id) { 9999 }
        let(:post_id) { 9999 }
        let(:Authorization) { 'Bearer your_auth_token' }

        run_test!
      end
    end

    post 'Creates a new comment' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: 'Authorization', in: :header, type: :string, required: true
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'Comment created successfully' do
        let!(:user) { create(:user) }
        let!(:post) { create(:post, user:) }
        let(:user_id) { user.id }
        let(:post_id) { post.id }
        let(:comment) { { text: 'New comment' } }
        let(:Authorization) { 'Bearer your_auth_token' }

        run_test!
      end

      response '422', 'Invalid comment data' do
        let!(:user) { create(:user) }
        let!(:post) { create(:post, user:) }
        let(:user_id) { user.id }
        let(:post_id) { post.id }
        let(:comment) { { text: '' } }
        let(:Authorization) { 'Bearer your_auth_token' }

        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
