require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get info" do
    get welcome_info_url
    assert_response :success
  end

  test "should get signuplogin" do
    get welcome_signuplogin_url
    assert_response :success
  end

  test "should get terms" do
    get welcome_terms_url
    assert_response :success
  end

end
