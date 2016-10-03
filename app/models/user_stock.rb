class UserStock < ApplicationRecord
	belongs_to :user
	belongs_to :stock
	has_many :stock_prices, through: :stock
end
