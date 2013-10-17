require 'test_helper'

class PaypalAppsControllerTest < ActionController::TestCase
  setup do
    @paypal_app = paypal_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paypal_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paypal_app" do
    assert_difference('PaypalApp.count') do
      post :create, paypal_app: { app_id: @paypal_app.app_id, client_id: @paypal_app.client_id, client_secret: @paypal_app.client_secret, password: @paypal_app.password, signature: @paypal_app.signature, username: @paypal_app.username }
    end

    assert_redirected_to paypal_app_path(assigns(:paypal_app))
  end

  test "should show paypal_app" do
    get :show, id: @paypal_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paypal_app
    assert_response :success
  end

  test "should update paypal_app" do
    patch :update, id: @paypal_app, paypal_app: { app_id: @paypal_app.app_id, client_id: @paypal_app.client_id, client_secret: @paypal_app.client_secret, password: @paypal_app.password, signature: @paypal_app.signature, username: @paypal_app.username }
    assert_redirected_to paypal_app_path(assigns(:paypal_app))
  end

  test "should destroy paypal_app" do
    assert_difference('PaypalApp.count', -1) do
      delete :destroy, id: @paypal_app
    end

    assert_redirected_to paypal_apps_path
  end
end
