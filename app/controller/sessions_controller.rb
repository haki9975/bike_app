class SessionsController < ApplicationController
  #if logged in, don't login again
  get '/login' do
    redirect_if_logged_in
    erb :"sessions/new"
  end

  post '/login' do
    redirect_if_logged_in
    user = User.find_by(email: params["user"]["email"])
      if user && user.authenticate(params["user"]["password"])
        session["user_id:"] = user.id 
        redirect "/bikes"
      else
        redirect "/login"
      end
  end

  get "/logout" do 
    #redirect_if_not_logged_in
    session.clear
    redirect "/"
  end
  
end