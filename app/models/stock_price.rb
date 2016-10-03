class StockPrice < ApplicationRecord
	belongs_to :stock, dependent: :destroy
	def set_price
		scraped_price= StockQuote::Stock.quote(self.stock.ticker).close || 0
		if scraped_price.zero?
			scraped_price= StockQuote::Stock.quote(self.stock.ticker).open || 0
		end
		update_attribute(:price, scraped_price)
	end
end
