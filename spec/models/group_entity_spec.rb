require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  describe 'associations' do
    it 'belongs to a group' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: '123456')
      group = user.groups.create(name: 'Group 1', icon: 'Icon 1')
      entity = user.entities.create(name: 'Entity 1', amount: 10)
      group_entity = group.group_entities.create(entity:)
      expect(group_entity.group).to eq(group)
    end

    it 'belongs to an entity' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: '123456')
      group = user.groups.create(name: 'Group 1', icon: 'Icon 1')
      entity = user.entities.create(name: 'Entity 1', amount: 10)
      group_entity = group.group_entities.create(entity:)
      expect(group_entity.entity).to eq(entity)
    end
  end
end
