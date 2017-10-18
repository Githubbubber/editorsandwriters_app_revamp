require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get info" do
    get info_url
    assert_response :success
  end

  test "should get signuplogin" do
    get signuplogin_url
    assert_response :success
  end

  test "should get terms" do
    get terms_url
    assert_response :success
  end

end
