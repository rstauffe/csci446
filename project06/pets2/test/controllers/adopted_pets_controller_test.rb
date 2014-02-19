require 'test_helper'

class AdoptedPetsControllerTest < ActionController::TestCase
  setup do
    @adopted_pet = adopted_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adopted_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adopted_pet" do
    assert_difference('AdoptedPet.count') do
      post :create, adopted_pet: { cat_id: @adopted_pet.cat_id, selection_id: @adopted_pet.selection_id }
    end

    assert_redirected_to adopted_pet_path(assigns(:adopted_pet))
  end

  test "should show adopted_pet" do
    get :show, id: @adopted_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adopted_pet
    assert_response :success
  end

  test "should update adopted_pet" do
    patch :update, id: @adopted_pet, adopted_pet: { cat_id: @adopted_pet.cat_id, selection_id: @adopted_pet.selection_id }
    assert_redirected_to adopted_pet_path(assigns(:adopted_pet))
  end

  test "should destroy adopted_pet" do
    assert_difference('AdoptedPet.count', -1) do
      delete :destroy, id: @adopted_pet
    end

    assert_redirected_to adopted_pets_path
  end
end
