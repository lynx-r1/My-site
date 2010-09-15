require 'test_helper'

class PostOthersControllerTest < ActionController::TestCase
  setup do
    @post_other = post_others(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_others)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_other" do
    assert_difference('PostOther.count') do
      post :create, :post_other => @post_other.attributes
    end

    assert_redirected_to post_other_path(assigns(:post_other))
  end

  test "should show post_other" do
    get :show, :id => @post_other.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post_other.to_param
    assert_response :success
  end

  test "should update post_other" do
    put :update, :id => @post_other.to_param, :post_other => @post_other.attributes
    assert_redirected_to post_other_path(assigns(:post_other))
  end

  test "should destroy post_other" do
    assert_difference('PostOther.count', -1) do
      delete :destroy, :id => @post_other.to_param
    end

    assert_redirected_to post_others_path
  end
end
