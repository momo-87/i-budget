require_relative '../rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create!(name: 'Christian Momo') }
  let(:group) { user.groups.create!(name: 'groupe 1', icon: 'group1 icon') }

  describe 'validation' do
    it 'requires name to be present' do
      group.name = nil
      expect(group).not_to be_valid
    end

    it 'requires icon to be present' do
      group.icon = nil
      expect(group).not_to be_valid
    end
  end
end
