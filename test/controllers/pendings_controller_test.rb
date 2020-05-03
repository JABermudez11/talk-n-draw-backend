require 'test_helper'

class PendingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pending = pendings(:one)
  end

  test "should get index" do
    get pendings_url, as: :json
    assert_response :success
  end

  test "should create pending" do
    assert_difference('Pending.count') do
      post pendings_url, params: { pending: { friend_id: @pending.friend_id, owner_id: @pending.owner_id } }, as: :json
    end

    assert_response 201
  end

  test "should show pending" do
    get pending_url(@pending), as: :json
    assert_response :success
  end

  test "should update pending" do
    patch pending_url(@pending), params: { pending: { friend_id: @pending.friend_id, owner_id: @pending.owner_id } }, as: :json
    assert_response 200
  end

  test "should destroy pending" do
    assert_difference('Pending.count', -1) do
      delete pending_url(@pending), as: :json
    end

    assert_response 204
  end
end
