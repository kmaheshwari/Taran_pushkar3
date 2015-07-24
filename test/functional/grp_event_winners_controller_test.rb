require 'test_helper'

class GrpEventWinnersControllerTest < ActionController::TestCase
  setup do
    @grp_event_winner = grp_event_winners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grp_event_winners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grp_event_winner" do
    assert_difference('GrpEventWinner.count') do
      post :create, grp_event_winner: { gpoints: @grp_event_winner.gpoints }
    end

    assert_redirected_to grp_event_winner_path(assigns(:grp_event_winner))
  end

  test "should show grp_event_winner" do
    get :show, id: @grp_event_winner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grp_event_winner
    assert_response :success
  end

  test "should update grp_event_winner" do
    put :update, id: @grp_event_winner, grp_event_winner: { gpoints: @grp_event_winner.gpoints }
    assert_redirected_to grp_event_winner_path(assigns(:grp_event_winner))
  end

  test "should destroy grp_event_winner" do
    assert_difference('GrpEventWinner.count', -1) do
      delete :destroy, id: @grp_event_winner
    end

    assert_redirected_to grp_event_winners_path
  end
end
