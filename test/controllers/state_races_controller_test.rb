require 'test_helper'

class StateRacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get state_races_index_url
    assert_response :success
  end

  test "should get show" do
    get state_races_show_url
    assert_response :success
  end

  test "should get update" do
    get state_races_update_url
    assert_response :success
  end

  test "should get delete" do
    get state_races_delete_url
    assert_response :success
  end

end
