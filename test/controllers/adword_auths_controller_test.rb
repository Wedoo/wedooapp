require 'test_helper'

class AdwordAuthsControllerTest < ActionController::TestCase
  setup do
    @adword_auth = adword_auths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adword_auths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adword_auth" do
    assert_difference('AdwordAuth.count') do
      post :create, adword_auth: { access_token: @adword_auth.access_token, expires_in: @adword_auth.expires_in, initiative_id: @adword_auth.initiative_id, issued_at: @adword_auth.issued_at, refresh_token: @adword_auth.refresh_token }
    end

    assert_redirected_to adword_auth_path(assigns(:adword_auth))
  end

  test "should show adword_auth" do
    get :show, id: @adword_auth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adword_auth
    assert_response :success
  end

  test "should update adword_auth" do
    patch :update, id: @adword_auth, adword_auth: { access_token: @adword_auth.access_token, expires_in: @adword_auth.expires_in, initiative_id: @adword_auth.initiative_id, issued_at: @adword_auth.issued_at, refresh_token: @adword_auth.refresh_token }
    assert_redirected_to adword_auth_path(assigns(:adword_auth))
  end

  test "should destroy adword_auth" do
    assert_difference('AdwordAuth.count', -1) do
      delete :destroy, id: @adword_auth
    end

    assert_redirected_to adword_auths_path
  end
end
