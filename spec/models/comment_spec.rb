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
      comment = Comment.new(post: post, author: user, text: 'Test1')
  
      expect {
        comment.save!
        post.reload
      }.to change { post.comments_counter }.by(1)
    end
  end

  describe 'private methods' do
    describe '#update_post_comments_counter' do
      let!(:author) { User.create!(name: 'Ruby Guy') }
      let!(:post) { Post.create!(title: 'Test1', text: 'This is test', comments_counter: 0, likes_counter: 0, author: author) }
      let(:comment) { Comment.new(post: post, author: author) }
  
      it 'updates the comments counter of the associated post' do
        expect {
          comment.save!
          post.reload
        }.to change { post.comments_counter }.by(1)
      end
    end
  end
end