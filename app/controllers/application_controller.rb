require "./config/environment"
require "./app/models/tweet"
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "Chattr"
  end

  get "/" do
    @all_tweets = Tweet.all
    @all_users = User.all
    erb :index
  end

  get "/land" do
    puts "landing page"
  end

  get "/signin" do
    erb :signin
  end

  get"/signup" do
    erb :signup
  end

  get "/profile/:id" do
    @user = User.find_by({:id => params[:id]})
    @user_tweets = Tweet.where({:user_id => params[:id]})
    erb :profile
  end

  post "/new_tweet" do
    @tweet = Tweet.new({:user_id => session[:user_id], :message => params[:message], :time => Time.new})
    @tweet.save
    redirect "/"
  end

  post "/new_user" do
    @user = User.new({:username => params[:username], :email => params[:email], :realname => params[:realname]})
    @user.save
    redirect "/"
  end

  post "/login" do
    @user = User.find_by({:username => params[:username]})
    if @user #exists
      #start session
      session[:user_id] = @user.id
    elsif @user == nil
      #throw an error
      @account_fail = true
      redirect "/"
    end
    redirect "/profile/#{@user.id}"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end

