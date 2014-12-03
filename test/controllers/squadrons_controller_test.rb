require 'test_helper'

class SquadronsControllerTest < ActionController::TestCase
  setup do
    @squadron = squadrons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:squadrons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create squadron" do
    assert_difference('Squadron.count') do
      post :create, squadron: { description: @squadron.description, draws: @squadron.draws, faction_id: @squadron.faction_id, losses: @squadron.losses, name: @squadron.name, points: @squadron.points, slug: @squadron.slug, wins: @squadron.wins }
    end

    assert_redirected_to squadron_path(assigns(:squadron))
  end

  test "should show squadron" do
    get :show, id: @squadron
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @squadron
    assert_response :success
  end

  test "should update squadron" do
    patch :update, id: @squadron, squadron: { description: @squadron.description, draws: @squadron.draws, faction_id: @squadron.faction_id, losses: @squadron.losses, name: @squadron.name, points: @squadron.points, slug: @squadron.slug, wins: @squadron.wins }
    assert_redirected_to squadron_path(assigns(:squadron))
  end

  test "should destroy squadron" do
    assert_difference('Squadron.count', -1) do
      delete :destroy, id: @squadron
    end

    assert_redirected_to squadrons_path
  end
end
