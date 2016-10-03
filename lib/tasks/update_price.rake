namespace :update_price do
	desc "create stock_price object and adjust the share's current value"
	task :update_price => :environment do
		@shares= Share.all
		@share.each do |s|
			s.set_current_share_price!
		end
	end
end
