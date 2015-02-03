require 'test_helper'

class VisitormailersControllerTest < ActionController::TestCase
  setup do
    @visitormailer = visitormailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitormailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitormailer" do
    assert_difference('Visitormailer.count') do
      post :create, visitormailer: { email: @visitormailer.email, login: @visitormailer.login, name: @visitormailer.name }
    end

    assert_redirected_to visitormailer_path(assigns(:visitormailer))
  end

  test "should show visitormailer" do
    get :show, id: @visitormailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitormailer
    assert_response :success
  end

  test "should update visitormailer" do
    patch :update, id: @visitormailer, visitormailer: { email: @visitormailer.email, login: @visitormailer.login, name: @visitormailer.name }
    assert_redirected_to visitormailer_path(assigns(:visitormailer))
  end

  test "should destroy visitormailer" do
    assert_difference('Visitormailer.count', -1) do
      delete :destroy, id: @visitormailer
    end

    assert_redirected_to visitormailers_path
  end
end
