require 'test_helper'

class CollectionsControllerTest < ActionController::TestCase
  setup do
    @collection = collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collections)
  end

  test "should create collection" do
    assert_difference('Collection.count') do
      post :create, collection: { name: @collection.name, owner: @collection.owner }
    end

    assert_response 201
  end

  test "should show collection" do
    get :show, id: @collection
    assert_response :success
  end

  test "should update collection" do
    put :update, id: @collection, collection: { name: @collection.name, owner: @collection.owner }
    assert_response 204
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete :destroy, id: @collection
    end

    assert_response 204
  end
end
