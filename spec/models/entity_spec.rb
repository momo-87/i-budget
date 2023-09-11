require_relative '../rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create!(name: 'Christian Momo') }
  let(:entity) { Entity.create!(name: 'entity name', author: user) }

  describe 'validation' do
    it 'requires name to be present' do
      entity.name = nil
      expect(entity).not_to be_valid
    end

    it 'requires amount to be positive' do
      entity.amount = -2.5
      expect(entity).not_to be_valid
    end
  end
end