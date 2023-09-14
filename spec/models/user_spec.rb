require_relative '../rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: 'Christian Momo', email: 'mm@recipapp.com', password: '123456') }

  describe 'validation' do
    it 'requires name to be present' do
      user.name = nil
      expect(user).not_to be_valid
    end
  end
end
