require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @list = lists(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get lists_url
    assert_response :success
  end

  test "should get new" do
    get new_list_url
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post lists_url, params: { list: { description: @list.description, title: @list.title } }
    end

    assert_redirected_to list_url(List.last)
  end

  test "should show list" do
    get list_url(@list)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_url(@list)
    assert_response :success
  end

  test "should update list" do
    patch list_url(@list), params: { list: { description: @list.description, title: @list.title } }
    assert_redirected_to list_url(@list)
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete list_url(@list)
    end

    assert_redirected_to lists_url
  end

  test "should not show the import link when feature isn't enabled" do
    get list_url(@list)
    assert_select '.glyphicon-import', false
  end

  test "should show the import link when the feature is enabled" do
    FlipperDemo.flipper.enable(:import)
    get list_url(@list)
    assert_select '.glyphicon-import'
  end
end
