require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_redirected_to admin_login_path
  end

  test "should get index" do
    get :index
    assert_redirected_to admin_login_path
  end

end
