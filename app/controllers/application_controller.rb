require "./config/environment"
require "./app/models/tweet"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    a_tweet = Tweet.new("Dev", "Hello")
    b_tweet = Tweet.new("Dev", "This")
    c_tweet = Tweet.new("Dev", "Is")
    d_tweet = Tweet.new("Dev", "For")
    e_tweet = Tweet.new("Dev", "Testing")
    @all_tweets = Tweet.all
  	erb :index
  end

  get "/signin" do
    erb :signin
  end

  post "/new_tweet" do
     puts params
     Tweet.new(params[:username], params[:message])
     @all_tweets = Tweet.all
     puts Tweet.all
     erb :index
  end

end

