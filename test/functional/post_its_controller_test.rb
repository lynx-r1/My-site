require 'test_helper'

class PostItsControllerTest < ActionController::TestCase
  setup do
    @post_it = post_its(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_its)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_it" do
    assert_difference('PostIt.count') do
      post :create, :post_it => @post_it.attributes
    end

    assert_redirected_to post_it_path(assigns(:post_it))
  end

  test "should show post_it" do
    get :show, :id => @post_it.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post_it.to_param
    assert_response :success
  end

  test "should update post_it" do
    put :update, :id => @post_it.to_param, :post_it => @post_it.attributes
    assert_redirected_to post_it_path(assigns(:post_it))
  end

  test "should destroy post_it" do
    assert_difference('PostIt.count', -1) do
      delete :destroy, :id => @post_it.to_param
    end

    assert_redirected_to post_its_path
  end
end
