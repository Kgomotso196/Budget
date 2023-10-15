require 'test_helper'

class GroupEntitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_entity = group_entities(:one)
  end

  test 'should get index' do
    get group_entities_url
    assert_response :success
  end

  test 'should get new' do
    get new_group_entity_url
    assert_response :success
  end

  test 'should create group_entity' do
    assert_difference('GroupEntity.count') do
      post group_entities_url,
           params: { group_entity: { entity_id: @group_entity.entity_id, group_id: @group_entity.group_id } }
    end

    assert_redirected_to group_entity_url(GroupEntity.last)
  end

  test 'should show group_entity' do
    get group_entity_url(@group_entity)
    assert_response :success
  end

  test 'should get edit' do
    get edit_group_entity_url(@group_entity)
    assert_response :success
  end

  test 'should update group_entity' do
    patch group_entity_url(@group_entity),
          params: { group_entity: { entity_id: @group_entity.entity_id, group_id: @group_entity.group_id } }
    assert_redirected_to group_entity_url(@group_entity)
  end

  test 'should destroy group_entity' do
    assert_difference('GroupEntity.count', -1) do
      delete group_entity_url(@group_entity)
    end

    assert_redirected_to group_entities_url
  end
end
