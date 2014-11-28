require 'test_helper'

class UpgradesControllerTest < ActionController::TestCase
  setup do
    @upgrade = upgrades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upgrades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upgrade" do
    assert_difference('Upgrade.count') do
      post :create, upgrade: { ability: @upgrade.ability, attack_value: @upgrade.attack_value, category: @upgrade.category, cost: @upgrade.cost, name: @upgrade.name, slug: @upgrade.slug, weapon_range: @upgrade.weapon_range }
    end

    assert_redirected_to upgrade_path(assigns(:upgrade))
  end

  test "should show upgrade" do
    get :show, id: @upgrade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upgrade
    assert_response :success
  end

  test "should update upgrade" do
    patch :update, id: @upgrade, upgrade: { ability: @upgrade.ability, attack_value: @upgrade.attack_value, category: @upgrade.category, cost: @upgrade.cost, name: @upgrade.name, slug: @upgrade.slug, weapon_range: @upgrade.weapon_range }
    assert_redirected_to upgrade_path(assigns(:upgrade))
  end

  test "should destroy upgrade" do
    assert_difference('Upgrade.count', -1) do
      delete :destroy, id: @upgrade
    end

    assert_redirected_to upgrades_path
  end
end
