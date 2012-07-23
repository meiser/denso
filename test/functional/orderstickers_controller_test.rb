require 'test_helper'

class OrderstickersControllerTest < ActionController::TestCase
  setup do
    @ordersticker = orderstickers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orderstickers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordersticker" do
    assert_difference('Ordersticker.count') do
      post :create, ordersticker: {  }
    end

    assert_redirected_to ordersticker_path(assigns(:ordersticker))
  end

  test "should show ordersticker" do
    get :show, id: @ordersticker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordersticker
    assert_response :success
  end

  test "should update ordersticker" do
    put :update, id: @ordersticker, ordersticker: {  }
    assert_redirected_to ordersticker_path(assigns(:ordersticker))
  end

  test "should destroy ordersticker" do
    assert_difference('Ordersticker.count', -1) do
      delete :destroy, id: @ordersticker
    end

    assert_redirected_to orderstickers_path
  end
end
