class StocksController < ApplicationController
	def search
		if params[:stock]
			@stock= Stock.find_by_ticker(params[:stock])
			@stock||= Stock.new_from_lookup(params[:stock])
		end
		if @stock 
			#StockPrice.create(stock_id: @stock.id)
			#@stock.set_current_share_price
			#render json: @stock
			render partial: 'lookup'
		else 
			render status: :not_found, nothing: true
		end 
	end

	
end
