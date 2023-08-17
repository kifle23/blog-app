require 'rails_helper'

describe Comment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to belong_to(:post) }
  end

  describe 'callbacks' do
    let!(:user) { User.create(name: 'Ruby Guy', posts_count: 0) }

    it 'updates the comments counter of the associated post after create' do
      post = Post.create!(title: 'Test1', text: 'This is test', comments_counter: 0, likes_counter: 0, author: user)
      comment = Comment.new(post:, author: user, text: 'Test1')

      expect do
        comment.save!
        post.reload
      end.to change { post.comments_counter }.by(1)
    end
  end

  describe 'private methods' do
    describe '#update_post_comments_counter' do
      let!(:author) { User.create!(name: 'Ruby Guy') }
      let!(:post) do
        Post.create!(title: 'Test1', text: 'This is test', comments_counter: 0, likes_counter: 0, author:)
      end
      let(:comment) { Comment.new(post:, author:) }

      it 'updates the comments counter of the associated post' do
        expect do
          comment.save!
          post.reload
        end.to change { post.comments_counter }.by(1)
      end
    end
  end
end
