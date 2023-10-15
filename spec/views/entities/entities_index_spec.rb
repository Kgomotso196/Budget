require 'rails_helper'

RSpec.describe 'entities#index', type: :feature do
  describe 'entity' do
    before(:each) do
      @user = User.create(name: 'Ranjeet', email: 'amy@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'amy@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @group = Group.create(user: @user, name: 'Cars', icon: 'https://icon-link')

      @entity1 = Entity.create(user: @user, name: 'Food', amount: 5)
      @entity2 = Entity.create(user: @user, name: 'Car', amount: 5)
      @entity3 = Entity.create(user: @user, name: 'Drink', amount: 5)
      @entity4 = Entity.create(user: @user, name: 'Oil', amount: 5)

      @group_entity = GroupEntity.create(group: @group, entity: @entity1)

      visit(group_entities_path(@group.id))
    end

    it 'shows the entity amount' do
      expect(page).to have_content('5')
    end
  end
end
