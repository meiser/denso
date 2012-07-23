require 'test_helper'

class BundlestickersControllerTest < ActionController::TestCase
  setup do
    @bundlesticker = bundlestickers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bundlestickers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bundlesticker" do
    assert_difference('Bundlesticker.count') do
      post :create, bundlesticker: {  }
    end

    assert_redirected_to bundlesticker_path(assigns(:bundlesticker))
  end

  test "should show bundlesticker" do
    get :show, id: @bundlesticker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bundlesticker
    assert_response :success
  end

  test "should update bundlesticker" do
    put :update, id: @bundlesticker, bundlesticker: {  }
    assert_redirected_to bundlesticker_path(assigns(:bundlesticker))
  end

  test "should destroy bundlesticker" do
    assert_difference('Bundlesticker.count', -1) do
      delete :destroy, id: @bundlesticker
    end

    assert_redirected_to bundlestickers_path
  end
end
