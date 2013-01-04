require 'test_helper'

class MiniadminsControllerTest < ActionController::TestCase
  setup do
    @miniadmin = miniadmins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:miniadmins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create miniadmin" do
    assert_difference('Miniadmin.count') do
      post :create, miniadmin: { image: @miniadmin.image, status: @miniadmin.status }
    end

    assert_redirected_to miniadmin_path(assigns(:miniadmin))
  end

  test "should show miniadmin" do
    get :show, id: @miniadmin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miniadmin
    assert_response :success
  end

  test "should update miniadmin" do
    put :update, id: @miniadmin, miniadmin: { image: @miniadmin.image, status: @miniadmin.status }
    assert_redirected_to miniadmin_path(assigns(:miniadmin))
  end

  test "should destroy miniadmin" do
    assert_difference('Miniadmin.count', -1) do
      delete :destroy, id: @miniadmin
    end

    assert_redirected_to miniadmins_path
  end
end
