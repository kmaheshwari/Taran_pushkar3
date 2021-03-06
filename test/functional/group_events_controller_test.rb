require 'test_helper'

class GroupEventsControllerTest < ActionController::TestCase
  setup do
    @group_event = group_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_event" do
    assert_difference('GroupEvent.count') do
      post :create, group_event: { grp_event_name: @group_event.grp_event_name, grp_event_type: @group_event.grp_event_type }
    end

    assert_redirected_to group_event_path(assigns(:group_event))
  end

  test "should show group_event" do
    get :show, id: @group_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_event
    assert_response :success
  end

  test "should update group_event" do
    put :update, id: @group_event, group_event: { grp_event_name: @group_event.grp_event_name, grp_event_type: @group_event.grp_event_type }
    assert_redirected_to group_event_path(assigns(:group_event))
  end

  test "should destroy group_event" do
    assert_difference('GroupEvent.count', -1) do
      delete :destroy, id: @group_event
    end

    assert_redirected_to group_events_path
  end
end
