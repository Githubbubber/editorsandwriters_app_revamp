require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  	test "should not save member without alter ego" do
	  member = Member.new
	  assert_not member.save, "Saved the member without an alter ego"
	end

	test "should report error" do
		assert_raises(NameError) do
	  		some_undefined_variable
	  	end
	end
end
