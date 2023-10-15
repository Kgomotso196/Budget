require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'validations' do
    it 'is valid with a name and amount' do
      user = User.create(name: 'John Doe')
      entity = user.entities.build(name: 'Entity 1', amount: 10)
      expect(entity).to be_valid
    end

    it 'is invalid without a name' do
      user = User.create(name: 'John Doe')
      entity = user.entities.build(name: nil, amount: 10)
      expect(entity).to_not be_valid
    end

    it 'is invalid with a name longer than 50 characters' do
      user = User.create(name: 'John Doe')
      entity = user.entities.build(name: 'a' * 51, amount: 10)
      expect(entity).to_not be_valid
    end

    it 'is invalid without an amount' do
      user = User.create(name: 'John Doe')
      entity = user.entities.build(name: 'Entity 1', amount: nil)
      expect(entity).to_not be_valid
    end

    it 'is invalid with an amount less than 1' do
      user = User.create(name: 'John Doe')
      entity = user.entities.build(name: 'Entity 1', amount: 0)
      expect(entity).to_not be_valid
    end
  end
end
