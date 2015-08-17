require "./config/environment"
require "./app/models/tweet"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    h_tweet = Tweet.new("Lieutenant_Hawkeye", "Hello")
  	erb :index
  end



end

