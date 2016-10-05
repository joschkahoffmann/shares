namespace :update do
	desc "create stock_price object and adjust the share's current value"
	task :update_price => :environment do
		@stocks= Stock.all
		@stocks.each do |s|
			s.set_current_share_price!
		end
	end
end
