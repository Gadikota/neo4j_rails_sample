require 'test_helper'

class Dashboard::HomeControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
