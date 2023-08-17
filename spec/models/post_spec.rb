require 'rails_helper'
describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(250) }
    it { is_expected.to validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'methods' do
    let!(:user) { User.create(name: 'Ruby Guy') }
    let!(:post) do
      Post.create(title: 'Test', text: 'This is a test', comments_counter: 0, likes_counter: 0, author: user)
    end

    it 'returns the recent comments' do
      5.times { |i| Comment.create(post:, author: user, text: "Comment #{i}") }
      recent_comments = post.recent_comments(3)
      expect(recent_comments.length).to eq(3)
      expect(recent_comments.first.text).to eq('Comment 4')
      expect(recent_comments.last.text).to eq('Comment 2')
    end

    it 'updates the comments counter' do
      expect do
        Comment.create(post:, author: user, text: 'New comment')
        post.reload
      end.to change { post.comments_counter }.by(1)
    end

    it 'updates the likes counter' do
      expect do
        Like.create(post:, author: user)
        post.reload
      end.to change { post.likes_counter }.by(1)
    end
  end

  describe 'callbacks' do
    let!(:user) { User.create(name: 'Ruby Guy', posts_count: 0) }
    let!(:post) do
      Post.new(title: 'Test', text: 'This is a test', comments_counter: 0, likes_counter: 0, author: user)
    end

    it 'updates the author posts count after create' do
      expect do
        post.save!
      end.to change { user.reload.posts_count }.by(1)
    end
  end

  describe 'private methods' do
    describe '#update_author_posts_count' do
      let(:user) { User.create(name: 'Ruby Guy') }
      let(:post) do
        Post.create(title: 'Test', text: 'This is a test', comments_counter: 0, likes_counter: 0, author: user)
      end

      it 'updates the author posts count' do
        expect do
          post.send(:update_author_posts_count)
          user.reload
        end.to change { user.posts_count }.by(1)
      end
    end
  end
end
