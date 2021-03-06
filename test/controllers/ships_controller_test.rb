require 'test_helper'

class ShipsControllerTest < ActionController::TestCase
  setup do
    @ship = ships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ship" do
    assert_difference('Ship.count') do
      post :create, ship: { agility: @ship.agility, cost: @ship.cost, description: @ship.description, faction: @ship.faction, hull: @ship.hull, pilot_name: @ship.pilot_name, pilot_skill: @ship.pilot_skill, primary_weapon_value: @ship.primary_weapon_value, shield: @ship.shield, ship: @ship.ship, slug: @ship.slug }
    end

    assert_redirected_to ship_path(assigns(:ship))
  end

  test "should show ship" do
    get :show, id: @ship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ship
    assert_response :success
  end

  test "should update ship" do
    patch :update, id: @ship, ship: { agility: @ship.agility, cost: @ship.cost, description: @ship.description, faction: @ship.faction, hull: @ship.hull, pilot_name: @ship.pilot_name, pilot_skill: @ship.pilot_skill, primary_weapon_value: @ship.primary_weapon_value, shield: @ship.shield, ship: @ship.ship, slug: @ship.slug }
    assert_redirected_to ship_path(assigns(:ship))
  end

  test "should destroy ship" do
    assert_difference('Ship.count', -1) do
      delete :destroy, id: @ship
    end

    assert_redirected_to ships_path
  end
end
