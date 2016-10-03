class StockPricesController < ApplicationController
	
	def show
	end

	# def create
	# 	@stock= Stock.find(params[:stock_id])
	# 	@stock_price= @stock.stock_prices.create(stock_price_params)
	# 	@stock_price.set_price
	# 	@stock_price.reload
	# 	@stock_price.save
	# end

	def destroy
		StockPrice.find(params[:id]).destroy
	end

  private
  	def stock_price_params
  		params.require(:stock_price).permit(:price)
  	end
end
