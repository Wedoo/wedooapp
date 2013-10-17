require 'test_helper'

class PaymentAppsControllerTest < ActionController::TestCase
  setup do
    @payment_app = payment_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_app" do
    assert_difference('PaymentApp.count') do
      post :create, payment_app: { active: @payment_app.active, last_account_balance: @payment_app.last_account_balance, pay_service_id: @payment_app.pay_service_id, pay_service_type: @payment_app.pay_service_type }
    end

    assert_redirected_to payment_app_path(assigns(:payment_app))
  end

  test "should show payment_app" do
    get :show, id: @payment_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_app
    assert_response :success
  end

  test "should update payment_app" do
    patch :update, id: @payment_app, payment_app: { active: @payment_app.active, last_account_balance: @payment_app.last_account_balance, pay_service_id: @payment_app.pay_service_id, pay_service_type: @payment_app.pay_service_type }
    assert_redirected_to payment_app_path(assigns(:payment_app))
  end

  test "should destroy payment_app" do
    assert_difference('PaymentApp.count', -1) do
      delete :destroy, id: @payment_app
    end

    assert_redirected_to payment_apps_path
  end
end
