require 'test_helper'
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user= users(:michael)
  end

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_presence_of(:first_name)
  should validate_presence_of(:password)
  should have_many(:stocks)
  should have_many(:friends)
  should have_many(:friendships)
  should have_many(:user_stocks)
  should ensure_length_of(:email).is_at_most(150)
  should validate_uniqueness_of(:email)
  should_not allow_value("blah").for(:email)

  test "should destroy friendship when user is deleted" do
  	@user.save
  	@user.friendships.create!(user_id: 1, friend_id:1, created_at: Time.zone.now)
  	assert_difference "Friendship.count", -1 do
  		@user.destroy
  	end
  end






end
