require 'test_helper'

class NightHousesControllerTest < ActionController::TestCase
  setup do
    @night_house = night_houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:night_houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create night_house" do
    assert_difference('NightHouse.count') do
      post :create, night_house: { address: @night_house.address, category: @night_house.category, city: @night_house.city, cnpj: @night_house.cnpj, email: @night_house.email, name: @night_house.name, neighbourhood: @night_house.neighbourhood, state: @night_house.state }
    end

    assert_redirected_to night_house_path(assigns(:night_house))
  end

  test "should show night_house" do
    get :show, id: @night_house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @night_house
    assert_response :success
  end

  test "should update night_house" do
    patch :update, id: @night_house, night_house: { address: @night_house.address, category: @night_house.category, city: @night_house.city, cnpj: @night_house.cnpj, email: @night_house.email, name: @night_house.name, neighbourhood: @night_house.neighbourhood, state: @night_house.state }
    assert_redirected_to night_house_path(assigns(:night_house))
  end

  test "should destroy night_house" do
    assert_difference('NightHouse.count', -1) do
      delete :destroy, id: @night_house
    end

    assert_redirected_to night_houses_path
  end
end
