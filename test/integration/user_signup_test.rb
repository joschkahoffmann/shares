require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
	
	test "should sign up successfully" do
		visit new_user_registration_url
		assert_difference "User.count", 1 do
			fill_in "Email", with: "michael2@example.com"
			fill_in "First name", with: "Michael"
			fill_in "Last name", with: "Example"
			fill_in "Password", with: "password"
			fill_in "Password confirmation", with:"password"
			click_button "Sign up"			
			assert_equal root_path("Michael"), current_path
		end		
	end
  # test "the truth" do
  #   assert true
  # end

  test "signup with invalid info" do
  	visit new_user_registration_url
  	assert_no_difference "User.count" do
		fill_in "Email", with: "blah"
		fill_in "First name", with: ""
		fill_in "Last name", with: ""
		fill_in "Password", with: "foo"
		fill_in "Password confirmation", with:"bar"
		click_button "Sign up"
	end
  end



end
