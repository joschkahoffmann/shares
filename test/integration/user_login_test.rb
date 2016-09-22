require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user= users(:michael)
  end
  
  test "login_with correct information" do
  	login_as(@user)
  end

  test "unsuccessful login" do
  	visit new_user_session_path
  	fill_in "Email", with: "blah"
  	fill_in "Password", with: ""
  	click_button "Sign in"
  end
end
