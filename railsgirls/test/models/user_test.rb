require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name:"example user", email:"user@example.com")
	end
	

  # test "the truth" do
  #   assert true
  # end
end
