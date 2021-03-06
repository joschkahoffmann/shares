class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  	has_many :user_stocks
	has_many :stocks, through: :user_stocks
	has_many :friendships, dependent: :destroy
	has_many :friends, through: :friendships
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 150}
	#validates :password, presence: true

	def can_add_stock?(ticker_symbol)
		under_stock_limit? && !stock_already_added?(ticker_symbol)
	end

	def under_stock_limit?
		(user_stocks.count < 10)
	end

	def stock_already_added?(ticker_symbol)
		stock=Stock.find_by_ticker(ticker_symbol)
		return false unless stock
		user_stocks.where(stock_id: stock.id).exists?
	end

	def full_name
		return "#{first_name} #{last_name}".strip if (first_name || last_name)
		"Anonymous"
	end

	def not_friends_with?(friend_id)
		friendships.where(friend_id: friend_id).count < 1
	end

	def except_current_user(users)
		users.reject {|user| user.id == self.id}
	end

	def self.search(search_param)
		if search_param.blank?
			return ""
		else
			where("first_name LIKE ?", "%#{search_param}%") + 
			where("last_name LIKE ?", "%#{search_param}%") +
			where("email LIKE ?", "%#{search_param}")
		end
	end


end