require "test/unit"
require_relative '../twitter_bot'

class TwitterBotTest < Test::Unit::TestCase

  def test_timeline
    bot = TwitterBot.new('heikkiv')
    assert bot.timeline('heikkiv').length > 0
  end

  def test_get_latest_tweet_id
    bot = TwitterBot.new('heikkiv')
    assert bot.get_latest_tweet_id >= 261200869037576192
  end

  def test_process_tweets_until
    bot = TwitterBot.new('heikkiv')
    bot.process_tweets_until 235279825617686528
  end

end
