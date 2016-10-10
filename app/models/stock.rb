class Stock < ActiveRecord::Base
	after_create :set_current_share_price!
	has_many :user_stocks
	has_many :users, through: :user_stocks
	has_many :stock_prices
	
	def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first
	end


	def self.new_from_lookup(ticker_symbol)
		#cache= Rails.cache
		looked_up_stock= StockQuote::Stock.quote(ticker_symbol)
		#PriceService.outsource_this(ticker: looked_up_stock.symbol)
		return nil unless looked_up_stock.name
		@new_stock= new(ticker: looked_up_stock.symbol, 
		 			name: looked_up_stock.name)
		# closing_price = cache.read("stock_closing_#{id}")
		# if closing_price != nil
		# 	new_stock.update_attribute(:last_price, closing_price)
		# else
		# 	opening_price= cache.read("stock_opening_#{id}")
		# 	new_stock.update_attribute(:last_price, opening_price)
		# end
		#new_stock.last_price= new_stock.pric
	end

	def set_current_share_price!
		sp=self.stock_prices.create(stock_id: self.id)
		sp.set_price
		self.update_attribute(:last_price, sp.price)
	end

	
		#cache= Rails.cache

		#closing_price = cache.read("stock_closing_#{id}") || cache.write("stock_closing_#{id}", 
																#StockQuote::Stock.quote(ticker).close || 0) && cache.read("stock_closing_#{id}")
		#opening_price = cache.read("stock_opening_#{id}") || cache.write("stock_opening_#{id}", 
																#StockQuote::Stock.quote(ticker).open || 0) && cache.read("stock_opening_#{id}")	
		
		#PriceService.new.set_opening_price
		#return @opening_price
	#end



end

