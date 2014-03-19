require 'test_helper'

class CollectionConnectionsControllerTest < ActionController::TestCase
  setup do
    @collection_connection = collection_connections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection_connections)
  end

  test "should create collection_connection" do
    assert_difference('CollectionConnection.count') do
      post :create, collection_connection: { collection_id: @collection_connection.collection_id, email: @collection_connection.email, userid: @collection_connection.userid }
    end

    assert_response 201
  end

  test "should show collection_connection" do
    get :show, id: @collection_connection
    assert_response :success
  end

  test "should update collection_connection" do
    put :update, id: @collection_connection, collection_connection: { collection_id: @collection_connection.collection_id, email: @collection_connection.email, userid: @collection_connection.userid }
    assert_response 204
  end

  test "should destroy collection_connection" do
    assert_difference('CollectionConnection.count', -1) do
      delete :destroy, id: @collection_connection
    end

    assert_response 204
  end
end
