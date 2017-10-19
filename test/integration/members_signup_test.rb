require 'test_helper'

class MembersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signuplogin_path
    assert_difference 'Member.count' 1 do
      post members_path, params: { member: { alter_ego:  "",
                                         email: "member@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    follow_redirect!
    assert_template 'members/show'
    assert_not flash.FILL_IN
  end
end