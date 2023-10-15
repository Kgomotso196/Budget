require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: '123456')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid with a name longer than 50 characters' do
      user = User.new(name: 'a' * 51)
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many entities' do
      user = User.new(name: 'John Doe')
      entity1 = user.entities.build(name: 'Entity 1', amount: 100)
      entity2 = user.entities.build(name: 'Entity 2', amount: 100)
      expect(user.entities).to include(entity1)
      expect(user.entities).to include(entity2)
    end

    it 'has many groups' do
      user = User.new(name: 'John Doe')
      group1 = user.groups.build(name: 'Group 1', icon: 'https://images.pexels.com/photos/323682/pexels-photo-323682.jpeg')
      group2 = user.groups.build(name: 'Group 2', icon: 'https://images.pexels.com/photos/323682/pexels-photo-323682.jpeg')
      expect(user.groups).to include(group1)
      expect(user.groups).to include(group2)
    end
  end
end
