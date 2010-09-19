require 'test_helper'

class PostEventsControllerTest < ActionController::TestCase
  setup do
    @post_event = post_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_event" do
    assert_difference('PostEvent.count') do
      post :create, :post_event => @post_event.attributes
    end

    assert_redirected_to post_event_path(assigns(:post_event))
  end

  test "should show post_event" do
    get :show, :id => @post_event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post_event.to_param
    assert_response :success
  end

  test "should update post_event" do
    put :update, :id => @post_event.to_param, :post_event => @post_event.attributes
    assert_redirected_to post_event_path(assigns(:post_event))
  end

  test "should destroy post_event" do
    assert_difference('PostEvent.count', -1) do
      delete :destroy, :id => @post_event.to_param
    end

    assert_redirected_to post_events_path
  end
end
