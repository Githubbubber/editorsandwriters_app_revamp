require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  	def setup
		@member = Member.new(
	        acct_type: 'E', 
	        first_name: 'Big B', 
	        last_name: 'Bertha', 
	        alter_ego: 'BiggestBertha', 
	        email: 'BigBertha@BigBertha.com', 
	        password_digest: 'BigBertha', 
	        tagline: 'BigBertha', 
	        aboutme: 'BigBertha... BigBertha BigBertha', 
	        avatar: 'http://www.BigBertha.net', 
	        location: 'BigBertha', 
	        fav_style_manual: 'BigBertha', 
	        education: 'BigBertha', 
	        fav_advice: 'Big Bertha proudly!'
	    )
	end

	test "should be valid" do
		assert @member.valid?
	end

  	test "should not save member without alter ego" do
	  member = Member.new
	  assert_not member.save, "Saved the member without an alter ego"
	end

	test "membername should be present" do
		@member.alter_ego = "     "
		assert_not @member.valid?
	end

	test "email should be present" do
		@member.email = "     "
		assert_not @member.valid?
	end

	test "email should not be too long" do
		@member.email = "a" * 51
		assert_not @member.valid?
	end

	test "email should not be too short" do
		@member.email = "b" * 5
		assert_not @member.valid?
	end

	test "email validation should accept valid addresses" do
		valid_addresses = %w[member@example.com member@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@member.email = valid_address
			assert @member.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[member@example,com member_at_foo.org member.super.name@example. foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
			@member.email = invalid_address
			assert_not @member.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end

	test "password should be present" do
		@member.password_digest = "     "
		assert_not @member.valid?
	end

	test "password should not be too long" do
		@member.password_digest = "c" * 51
		assert_not @member.valid?
	end

	test "password should not be too short" do
		@member.password_digest = "d" * 5
		assert_not @member.valid?
	end

	test "first name should be present" do
		@member.first_name = "     "
		assert_not @member.valid?
	end

	test "first name should not be too long" do
		@member.first_name = "c" * 51
		assert_not @member.valid?
	end

	test "last name should be present" do
		@member.last_name = "     "
		assert_not @member.valid?
	end

	test "last name should not be too long" do
		@member.last_name = "c" * 51
		assert_not @member.valid?
	end
end
