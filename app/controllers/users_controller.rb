class UsersController < ApplicationController

  # GET: /users
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"users/show"
  end

  # GET: /users/signup
  get "/signup" do
    if !logged_in?
      flash[:message] = "Complete all required fields."
      erb :"/users/signup"
    else
      redirect to '/wardrobes'
    end
  end

  # POST: /signup
  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect "/signup"
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/wardrobes'
    end
  end

  # GET: /login
    get '/login' do
      if !logged_in?
        erb :'users/login'
      else
        redirect '/wardrobes'
      end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/wardrobes"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
