require "test_helper"

class BalancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get balances_index_url
    assert_response :success
  end

  test "should get show--force" do
    get balances_show--force_url
    assert_response :success
  end
end
