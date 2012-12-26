require 'rest_client'

class InstapaperClient

  INSTAPAPER_API_URL = 'https://www.instapaper.com/api/add'

  def initialize(username, password)
    @username = username
    @password = password
  end

  def add(link)
    RestClient.post INSTAPAPER_API_URL, :username => @username, :password => @password, :url => link
  end

end
