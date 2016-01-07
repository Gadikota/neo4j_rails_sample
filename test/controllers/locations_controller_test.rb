require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get import" do
    get :import
    assert_response :success
  end

end
