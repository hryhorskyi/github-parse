# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'fields' do
    it { is_expected.to have_db_column(:login).of_type(:string) }
    it { is_expected.to have_db_column(:full_name).of_type(:string) }
    it { is_expected.to have_db_column(:repos).of_type(:string) }
  end

  describe 'serialized repos' do
    it { is_expected.to serialize(:repos).as(Array) }
  end
end
