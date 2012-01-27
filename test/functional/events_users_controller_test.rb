require 'test_helper'

class EventsUsersControllerTest < ActionController::TestCase
  setup do
    @events_user = events_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create events_user" do
    assert_difference('EventsUser.count') do
      post :create, events_user: @events_user.attributes
    end

    assert_redirected_to events_user_path(assigns(:events_user))
  end

  test "should show events_user" do
    get :show, id: @events_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @events_user.to_param
    assert_response :success
  end

  test "should update events_user" do
    put :update, id: @events_user.to_param, events_user: @events_user.attributes
    assert_redirected_to events_user_path(assigns(:events_user))
  end

  test "should destroy events_user" do
    assert_difference('EventsUser.count', -1) do
      delete :destroy, id: @events_user.to_param
    end

    assert_redirected_to events_users_path
  end
end
