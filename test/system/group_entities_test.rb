require 'application_system_test_case'

class GroupEntitiesTest < ApplicationSystemTestCase
  setup do
    @group_entity = group_entities(:one)
  end

  test 'visiting the index' do
    visit group_entities_url
    assert_selector 'h1', text: 'Group entities'
  end

  test 'should create group entity' do
    visit group_entities_url
    click_on 'New group entity'

    fill_in 'Entity', with: @group_entity.entity_id
    fill_in 'Group', with: @group_entity.group_id
    click_on 'Create Group entity'

    assert_text 'Group entity was successfully created'
    click_on 'Back'
  end

  test 'should update Group entity' do
    visit group_entity_url(@group_entity)
    click_on 'Edit this group entity', match: :first

    fill_in 'Entity', with: @group_entity.entity_id
    fill_in 'Group', with: @group_entity.group_id
    click_on 'Update Group entity'

    assert_text 'Group entity was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Group entity' do
    visit group_entity_url(@group_entity)
    click_on 'Destroy this group entity', match: :first

    assert_text 'Group entity was successfully destroyed'
  end
end
