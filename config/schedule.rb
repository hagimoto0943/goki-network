require File.expand_path(File.dirname(__FILE__) + "/environment")
# Use this file to easily define all of your cron jobs.

# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
rails_env = ENV['RAILS_ENV'] || :development

# Example:

# set :output, "/path/to/my/cron_log.log"
set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

every 1.hour do
  rake "fight_status:change_to_be_done"
end

# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
