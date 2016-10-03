FactoryGirl.define do
	factory :user do
		first_name 'Boogy'
		last_name 'Cousins'
		sequence(:email) {|i|"boogycousins#{i}@gmail.com"}
		encrypted_password "<%= Devise::Encryptor.digest(User, 'password')%>"
	end

end