require "test_helper"

class ExpensesTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expenses_types_index_url
    assert_response :success
  end

  test "should get new" do
    get expenses_types_new_url
    assert_response :success
  end

  test "should get create" do
    get expenses_types_create_url
    assert_response :success
  end

  test "should get edit" do
    get expenses_types_edit_url
    assert_response :success
  end

  test "should get update" do
    get expenses_types_update_url
    assert_response :success
  end

  test "should get show" do
    get expenses_types_show_url
    assert_response :success
  end

  test "should get destroy" do
    get expenses_types_destroy_url
    assert_response :success
  end
end
