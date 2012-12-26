require "test/unit"
require_relative '../instapaper_client'

class InstapaperClientTest < Test::Unit::TestCase

  def test_add
    client = InstapaperClient.new('heikki.verta@gmail.com', ENV['INSTAPAPER_PASSWORD'])
    response = client.add('http://blog.instapaper.com/post/32233350372')
    assert_equal 201, response.code
  end

end