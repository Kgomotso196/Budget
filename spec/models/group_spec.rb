require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it 'is valid with a name and icon' do
      user = User.create(name: 'John Doe')
      group = user.groups.build(name: 'Group 1', icon: 'Icon 1')
      expect(group).to be_valid
    end

    it 'is invalid without a name' do
      user = User.create(name: 'John Doe')
      group = user.groups.build(name: nil, icon: 'Icon 1')
      expect(group).to_not be_valid
    end

    it 'is invalid with a name longer than 50 characters' do
      user = User.create(name: 'John Doe')
      group = user.groups.build(name: 'a' * 51, icon: 'Icon 1')
      expect(group).to_not be_valid
    end

    it 'is invalid without an icon' do
      user = User.create(name: 'John Doe')
      group = user.groups.build(name: 'Group 1', icon: nil)
      expect(group).to_not be_valid
    end

    it 'is invalid with an icon longer than 500 characters' do
      user = User.create(name: 'John Doe')
      group = user.groups.build(name: 'Group 1', icon: 'a' * 501)
      expect(group).to_not be_valid
    end
  end
end
