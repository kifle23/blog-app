require 'rails_helper'
describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts).with_foreign_key(:author_id) }
    it { is_expected.to have_many(:comments).with_foreign_key(:author_id) }
    it { is_expected.to have_many(:likes).with_foreign_key(:author_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:posts_count).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#recent_posts' do
    let(:user) { User.create(name: 'Ruby Guy') }
    let!(:post1) { Post.create(title: 'Test 1', text: 'This is test 1', author: user) }
    let!(:post2) { Post.create(title: 'Test 2', text: 'This is test 2', author: user) }
    let!(:post3) { Post.create(title: 'Test 3', text: 'This is test 3', author: user) }
    let!(:post4) { Post.create(title: 'Test 4', text: 'This is test 4', author: user) }

    it 'returns the recent posts with default limit' do
      expect(user.recent_posts).to eq([post4, post3, post2])
    end

    it 'returns the recent posts with custom limit' do
      expect(user.recent_posts(2)).to eq([post4, post3])
    end
  end
end
