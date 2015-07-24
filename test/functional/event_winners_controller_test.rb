require 'test_helper'

class EventWinnersControllerTest < ActionController::TestCase
  setup do
    @event_winner = event_winners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_winners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_winner" do
    assert_difference('EventWinner.count') do
      post :create, event_winner: { points: @event_winner.points }
    end

    assert_redirected_to event_winner_path(assigns(:event_winner))
  end

  test "should show event_winner" do
    get :show, id: @event_winner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_winner
    assert_response :success
  end

  test "should update event_winner" do
    put :update, id: @event_winner, event_winner: { points: @event_winner.points }
    assert_redirected_to event_winner_path(assigns(:event_winner))
  end

  test "should destroy event_winner" do
    assert_difference('EventWinner.count', -1) do
      delete :destroy, id: @event_winner
    end

    assert_redirected_to event_winners_path
  end
end
