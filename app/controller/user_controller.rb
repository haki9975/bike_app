class UserController < ApplicationController
  
    get '/signup' do
        redirect_if_logged_in
        erb :"users/new"
    end
  
    post '/signup' do
        redirect_if_logged_in
        if User.find_by(email: params["user"]["email"])
            redirect "/signup"
        end
       user=  User.new(params["user"])
        if user.save
            session["user_id"] = user.id
            redirect "/bikes"
        else
           redirect "/signup"
        end
    end
end