class Tweet
  #username
  #message
  attr_accessor :username, :message
end


tweet1 = Tweet.new
tweet1.username = "Jim"
tweet1.username
tweet1.message = "Danny is way better looking than I am"
tweet1.message