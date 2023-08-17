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
end