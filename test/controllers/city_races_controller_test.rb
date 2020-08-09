require 'test_helper'

class CityRacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get city_races_index_url
    assert_response :success
  end

  test "should get show" do
    get city_races_show_url
    assert_response :success
  end

  test "should get update" do
    get city_races_update_url
    assert_response :success
  end

  test "should get delete" do
    get city_races_delete_url
    assert_response :success
  end

end
