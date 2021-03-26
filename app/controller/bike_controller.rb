class BikeController < ApplicationController
    #Read all records ***this works!***
        get '/bikes' do
            redirect_if_not_logged_in
            #binding.pry
            @bikes = Bike.all
            erb :'bikes/index'
        end

    #Create new record (render form) ***This works!*** 
        get '/bikes/new' do
            redirect_if_not_logged_in
            erb :'bikes/new'
        end

    #Read one record ***This works!***
        get '/bikes/:id' do
            redirect_if_not_logged_in
            redirect_if_not_authorized
            erb :"bikes/show"
        end

    #Create new record (save in db) ***This seems to be working!***
        post '/bikes' do
          redirect_if_not_logged_in

          #bikes = Bike.new(params[:bikes])
          #bikes.user_id = session["user_id"]
          #binding.pry
            bike = current_user.bikes.build(params["bikes"])
           if bike.save 
              redirect "/bikes/#{bike.id}"
           else
              redirect "/bikes/new" 
           end
        end

    #Update one record (render form) ***This is working!!!***
        get '/bikes/:id/edit' do
            redirect_if_not_logged_in
            redirect_if_not_authorized
            erb :'bikes/edit'
        end


    #Update one record (save in db) ***This is working!!!***
        patch '/bikes/:id' do
            redirect_if_not_logged_in
            redirect_if_not_authorized
            #binding.pry
            @bikes.update_attributes(params[:bikes])
            if @bikes.save
                redirect "/bikes/#{@bikes.id}"
            else
                redirect "/bikes/:id/edit"
            end

        end

    #Delete one movie ***Not working yet***
        delete '/bikes/:id' do
           redirect_if_not_authorized
           redirect_if_not_logged_in
           @bikes.destroy
         end

    private
       def redirect_if_not_authorized
          @bikes = Bike.find_by_id(params[:id])
          if @bikes.user_id != session["user_id"]
            redirect "/bikes"
          end
        end

end