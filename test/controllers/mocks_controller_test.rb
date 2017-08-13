require 'test_helper'

class MocksControllerTest < ActionDispatch::IntegrationTest
  test "should get features" do
    get mocks_features_url
    assert_response :success
  end

  test "should get feature" do
    get mocks_feature_url
    assert_response :success
  end

  test "should get admin" do
    get mocks_admin_url
    assert_response :success
  end

end
