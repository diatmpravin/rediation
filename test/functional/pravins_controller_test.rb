require 'test_helper'

class PravinsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pravins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pravin" do
    assert_difference('Pravin.count') do
      post :create, :pravin => { }
    end

    assert_redirected_to pravin_path(assigns(:pravin))
  end

  test "should show pravin" do
    get :show, :id => pravins(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pravins(:one).to_param
    assert_response :success
  end

  test "should update pravin" do
    put :update, :id => pravins(:one).to_param, :pravin => { }
    assert_redirected_to pravin_path(assigns(:pravin))
  end

  test "should destroy pravin" do
    assert_difference('Pravin.count', -1) do
      delete :destroy, :id => pravins(:one).to_param
    end

    assert_redirected_to pravins_path
  end
end
