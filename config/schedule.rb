# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 #set :output, "/log/cron_log.log"
 set :environment, "development" 
 every 3.minutes do
#   command "/usr/bin/some_great_command"
#  runner "StockPrice.create"
   rake "update:update_price"
 end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
