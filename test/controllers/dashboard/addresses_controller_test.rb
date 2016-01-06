require 'test_helper'

class Dashboard::AddressesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get import" do
    get :import
    assert_response :success
  end

end