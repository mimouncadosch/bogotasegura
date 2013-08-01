require 'test_helper'

class CharatersControllerTest < ActionController::TestCase
  setup do
    @charater = charaters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charaters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charater" do
    assert_difference('Charater.count') do
      post :create, charater: { address: @charater.address, date: @charater.date, latitude: @charater.latitude, longitude: @charater.longitude, name: @charater.name, tipo: @charater.tipo }
    end

    assert_redirected_to charater_path(assigns(:charater))
  end

  test "should show charater" do
    get :show, id: @charater
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @charater
    assert_response :success
  end

  test "should update charater" do
    put :update, id: @charater, charater: { address: @charater.address, date: @charater.date, latitude: @charater.latitude, longitude: @charater.longitude, name: @charater.name, tipo: @charater.tipo }
    assert_redirected_to charater_path(assigns(:charater))
  end

  test "should destroy charater" do
    assert_difference('Charater.count', -1) do
      delete :destroy, id: @charater
    end

    assert_redirected_to charaters_path
  end
end
