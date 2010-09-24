require 'test_helper'

class PostNotesControllerTest < ActionController::TestCase
  setup do
    @post_note = post_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_note" do
    assert_difference('PostNote.count') do
      post :create, :post_note => @post_note.attributes
    end

    assert_redirected_to post_note_path(assigns(:post_note))
  end

  test "should show post_note" do
    get :show, :id => @post_note.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post_note.to_param
    assert_response :success
  end

  test "should update post_note" do
    put :update, :id => @post_note.to_param, :post_note => @post_note.attributes
    assert_redirected_to post_note_path(assigns(:post_note))
  end

  test "should destroy post_note" do
    assert_difference('PostNote.count', -1) do
      delete :destroy, :id => @post_note.to_param
    end

    assert_redirected_to post_notes_path
  end
end
