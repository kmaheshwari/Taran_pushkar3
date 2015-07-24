require 'test_helper'

class RaceTimingIndEvntsControllerTest < ActionController::TestCase
  setup do
    @race_timing_ind_evnt = race_timing_ind_evnts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:race_timing_ind_evnts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create race_timing_ind_evnt" do
    assert_difference('RaceTimingIndEvnt.count') do
      post :create, race_timing_ind_evnt: { micro_second: @race_timing_ind_evnt.micro_second, minute: @race_timing_ind_evnt.minute, second: @race_timing_ind_evnt.second }
    end

    assert_redirected_to race_timing_ind_evnt_path(assigns(:race_timing_ind_evnt))
  end

  test "should show race_timing_ind_evnt" do
    get :show, id: @race_timing_ind_evnt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @race_timing_ind_evnt
    assert_response :success
  end

  test "should update race_timing_ind_evnt" do
    put :update, id: @race_timing_ind_evnt, race_timing_ind_evnt: { micro_second: @race_timing_ind_evnt.micro_second, minute: @race_timing_ind_evnt.minute, second: @race_timing_ind_evnt.second }
    assert_redirected_to race_timing_ind_evnt_path(assigns(:race_timing_ind_evnt))
  end

  test "should destroy race_timing_ind_evnt" do
    assert_difference('RaceTimingIndEvnt.count', -1) do
      delete :destroy, id: @race_timing_ind_evnt
    end

    assert_redirected_to race_timing_ind_evnts_path
  end
end
