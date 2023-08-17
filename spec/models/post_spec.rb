require 'rails_helper'
describe Post, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to(:author).class_name('User') }
      it { is_expected.to have_many(:comments) }
      it { is_expected.to have_many(:likes) }
    end
end