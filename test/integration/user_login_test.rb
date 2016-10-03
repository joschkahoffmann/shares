require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user= Factory(:user)
  	@user2= Factory(:user)
  end
  
  test "login_with correct information" do
  	login_as(@user)
  end

  test "unsuccessful login" do
  	visit new_user_session_path
  	fill_in "Email", with: "blah"
  	fill_in "Password", with: ""
  	click_button "Sign in"
  	assert_equal current_url, new_user_session_url
  end
end
