class SessionsController < ApplicationController
  
  get '/login' do
    redirect_if_logged_in
    erb :"sessions/new"
  end

  post '/login' do
    redirect_if_logged_in
    user = User.find_by(email: params["user"]["email"])
      if user && user.authenticate(params["user"]["password"])
        session[:user_id] = user.id 
        redirect "/bikes"
      else
        redirect "/"
      end
  end

  get "/logout" do 
    session.clear
    redirect "/"
  end
  
end