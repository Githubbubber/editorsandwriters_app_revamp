require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Editors & Writers"
  end

  test "should get index" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get info" do
    get info_url
    assert_response :success
    assert_select "title", "Info | #{@base_title}"
  end

  test "should get signuplogin" do
    get signuplogin_url
    assert_response :success
    assert_select "title", "Sign up/Log in | #{@base_title}"
  end

  test "should get terms" do
    get terms_url
    assert_response :success
    assert_select "title", "Terms & Conditions | #{@base_title}"
  end

end
