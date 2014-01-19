require 'test_helper'

class RefuelsControllerTest < ActionController::TestCase
  setup do
    @refuel = refuels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refuels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refuel" do
    assert_difference('Refuel.count') do
      post :create, refuel: { car_id: @refuel.car_id, gallons: @refuel.gallons, miles: @refuel.miles, price: @refuel.price }
    end

    assert_redirected_to refuel_path(assigns(:refuel))
  end

  test "should show refuel" do
    get :show, id: @refuel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refuel
    assert_response :success
  end

  test "should update refuel" do
    patch :update, id: @refuel, refuel: { car_id: @refuel.car_id, gallons: @refuel.gallons, miles: @refuel.miles, price: @refuel.price }
    assert_redirected_to refuel_path(assigns(:refuel))
  end

  test "should destroy refuel" do
    assert_difference('Refuel.count', -1) do
      delete :destroy, id: @refuel
    end

    assert_redirected_to refuels_path
  end
end
