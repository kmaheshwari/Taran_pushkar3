require 'test_helper'

class RaceTimingGrpEvntsControllerTest < ActionController::TestCase
  setup do
    @race_timing_grp_evnt = race_timing_grp_evnts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:race_timing_grp_evnts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create race_timing_grp_evnt" do
    assert_difference('RaceTimingGrpEvnt.count') do
      post :create, race_timing_grp_evnt: { gmicro_second: @race_timing_grp_evnt.gmicro_second, gminute: @race_timing_grp_evnt.gminute, gsecond: @race_timing_grp_evnt.gsecond }
    end

    assert_redirected_to race_timing_grp_evnt_path(assigns(:race_timing_grp_evnt))
  end

  test "should show race_timing_grp_evnt" do
    get :show, id: @race_timing_grp_evnt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @race_timing_grp_evnt
    assert_response :success
  end

  test "should update race_timing_grp_evnt" do
    put :update, id: @race_timing_grp_evnt, race_timing_grp_evnt: { gmicro_second: @race_timing_grp_evnt.gmicro_second, gminute: @race_timing_grp_evnt.gminute, gsecond: @race_timing_grp_evnt.gsecond }
    assert_redirected_to race_timing_grp_evnt_path(assigns(:race_timing_grp_evnt))
  end

  test "should destroy race_timing_grp_evnt" do
    assert_difference('RaceTimingGrpEvnt.count', -1) do
      delete :destroy, id: @race_timing_grp_evnt
    end

    assert_redirected_to race_timing_grp_evnts_path
  end
end
