require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get tools_search_url
    assert_response :success
  end
end
