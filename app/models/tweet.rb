class Tweet
  attr_accessor :username, :message
  ALL_TWEETS = []

  def initialize(username, message)
  	@username = username
  	@message = message
    ALL_TWEETS << self
  end

  def self.all
    ALL_TWEETS
  end
end
