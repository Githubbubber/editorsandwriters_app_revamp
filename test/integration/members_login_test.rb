require 'test_helper'

class MembersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get signuplogin_path
    assert_template 'sessions/new'
    post login_path, params: { session: { alter_ego: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
