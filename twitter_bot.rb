require 'twitter'
require_relative 'instapaper_client'

class TwitterBot

  attr_accessor :latest_tweet_id, :user

  def initialize(user)
    @user = user
    @instapaper_client = InstapaperClient.new('heikki.verta@gmail.com', ENV['INSTAPAPER_PASSWORD'])
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = ENV['OAUTH_TOKEN']
      config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end
  end

  def timeline(user)
    Twitter.user_timeline(user)
  end

  def get_latest_tweet_id
    tweets = timeline(@user)
    tweets[0].id
  end

  def process_tweets_until(latest_tweet_id)
    tweets = timeline(@user)
    tweets.each do |tweet|
      if tweet.id > latest_tweet_id
        text = tweet.full_text
        puts "Processing #{text}"
        text.split.each do |word|
          if word.start_with? 'http://' || 'https://'
            @instapaper_client.add word
            puts "Added #{word} to instapaper"
          end
        end
      end
    end
  end

  def run
    puts 'Starting...'
    @latest_tweet_id = get_latest_tweet_id
    while true
      puts 'Checking new tweets'
      process_tweets_until @latest_tweet_id
      @latest_tweet_id = get_latest_tweet_id
      puts 'Sleeping'
      sleep(1000 * 60 * 5) # Wait 5 minutes
    end
  end

end
