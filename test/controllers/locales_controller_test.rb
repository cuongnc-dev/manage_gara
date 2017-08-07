require 'test_helper'

class LocalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get locales_index_url
    assert_response :success
  end

  test "should get update" do
    get locales_update_url
    assert_response :success
  end

end
