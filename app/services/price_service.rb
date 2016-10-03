class PriceService
  def self.outsource_this(ticker)	
  	cache= Rails.cache
  	looked_up_stock= StockQuote::Stock.quote(ticker)
  	cache.write("stock_closing_#{id}", looked_up_stock.close || 0)
  	cache.write("stock_opening_#{id}", looked_up_stock.open || 0)
  end
end