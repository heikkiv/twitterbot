require_relative 'twitter_bot'

task :default => [:test]

task :test do
  ruby "test/twitter_bot_test.rb"
  ruby "test/instapaper_client_test.rb"
end

task :run do
  bot = TwitterBot.new('heikkiv')
  bot.run
end
