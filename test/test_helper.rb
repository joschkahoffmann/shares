ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include Capybara::DSL
  fixtures :all
 
 	 	def teardown
  			Capybara.reset_sessions!
  			Capybara.use_default_driver
  		end

  		def login_as(user)
  			visit new_user_session_path
  			fill_in "Email", with: "michael@example.com"
  			fill_in "Password", with: "password"
  			click_button "Sign in"
  			assert_equal root_path(user), current_path
  		end
end
