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
end