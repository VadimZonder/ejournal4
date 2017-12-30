require 'test_helper'

class ParentFiltersControllerTest < ActionController::TestCase
  setup do
    @parent_filter = parent_filters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parent_filters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent_filter" do
    assert_difference('ParentFilter.count') do
      post :create, parent_filter: { filter: @parent_filter.filter }
    end

    assert_redirected_to parent_filter_path(assigns(:parent_filter))
  end

  test "should show parent_filter" do
    get :show, id: @parent_filter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent_filter
    assert_response :success
  end

  test "should update parent_filter" do
    patch :update, id: @parent_filter, parent_filter: { filter: @parent_filter.filter }
    assert_redirected_to parent_filter_path(assigns(:parent_filter))
  end

  test "should destroy parent_filter" do
    assert_difference('ParentFilter.count', -1) do
      delete :destroy, id: @parent_filter
    end

    assert_redirected_to parent_filters_path
  end
end
