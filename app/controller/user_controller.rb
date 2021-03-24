class UserController < ApplicationController
    #Read all records ***this works!***
        get '/user' do
            @user = UserController.all
            erb :'user/index'
        end

    #Create new record (render form) ***This works!*** 
        get '/user/new' do
            erb :'user/new'
        end

    #Read one record ***This works!***
        get '/user/:id' do
            @user = UserController.find_by_id(params[:id])
              erb :'user/show'
        end

    #Create new record (save in db) ***This seems to be working!***
        post '/user' do
           user = UserController.new(params[:user])
           if user.save 
                redirect "/user/#{user.id}"
           else
                redirect "/user/new" 
           end
        end

    #Update one record (render form) ***This is working!!!***
        get '/user/:id/edit' do
            @user = UserController.find_by_id(params[:id])
             erb :'user/edit'
        end


    #Update one record (save in db) ***This is working!!!***
        patch '/user/:id' do
            user = UserController.find_by_id(params[:id])
            #binding.pry
            user.update_attributes(params[:user])
            if user.save
                redirect "/user/#{user.id}"
            else
                redirect "/user/:id/edit"
            end

        end

    #Delete one movie ***Not working yet***
        delete '/user/:id' do
           user = UserController.find_by_id(params[:id])
           #binding.pry
           #user.destroy
            if user.destroy
              redirect "/user"
            else
              redirect "/user/#{user.id}"
            end
        end

end