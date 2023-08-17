require 'rails_helper'
describe User, type: :model do
    describe 'associations' do
      it { is_expected.to have_many(:posts).with_foreign_key(:author_id) }
      it { is_expected.to have_many(:comments).with_foreign_key(:author_id) }
      it { is_expected.to have_many(:likes).with_foreign_key(:author_id) }
    end
end