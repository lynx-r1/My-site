require 'test_helper'

class PostTechesControllerTest < ActionController::TestCase
  setup do
    @post_tech = post_teches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_teches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_tech" do
    assert_difference('PostTech.count') do
      post :create, :post_tech => @post_tech.attributes
    end

    assert_redirected_to post_tech_path(assigns(:post_tech))
  end

  test "should show post_tech" do
    get :show, :id => @post_tech.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post_tech.to_param
    assert_response :success
  end

  test "should update post_tech" do
    put :update, :id => @post_tech.to_param, :post_tech => @post_tech.attributes
    assert_redirected_to post_tech_path(assigns(:post_tech))
  end

  test "should destroy post_tech" do
    assert_difference('PostTech.count', -1) do
      delete :destroy, :id => @post_tech.to_param
    end

    assert_redirected_to post_teches_path
  end
end
