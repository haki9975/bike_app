class BikeController < ApplicationController
        get '/bikes' do
            redirect_if_not_logged_in
            @bikes = current_user.bikes
            erb :'bikes/index'
        end

        get '/bikes/new' do
            redirect_if_not_logged_in
            erb :'bikes/new'
        end

        get '/bikes/:id' do
            redirect_if_not_logged_in
            redirect_if_not_authorized
            erb :"bikes/show"
        end

        post '/bikes' do
          redirect_if_not_logged_in
            bike = current_user.bikes.build(params["bikes"])
           if bike.save 
              redirect "/bikes/#{bike.id}"
           else
            @error = "something went wrong"
            erb :"/bikes/new" 
           end
        end

        get '/bikes/:id/edit' do
            redirect_if_not_logged_in
            redirect_if_not_authorized
            erb :'bikes/edit'
        end

        patch '/bikes/:id' do
            redirect_if_not_logged_in
            redirect_if_not_authorized
            @bikes.update_attributes(params[:bikes])
            if @bikes.save
                redirect "/bikes/#{@bikes.id}"
            else
                redirect "/bikes/:id/edit"
            end

        end

        delete '/bikes/:id' do
           redirect_if_not_authorized
           redirect_if_not_logged_in
           @bikes.destroy
           redirect '/bikes'
         end

    private
       def redirect_if_not_authorized
          @bikes = Bike.find_by_id(params[:id])
          if @bikes.user_id != session["user_id"]
            redirect "/bikes"
          end
        end
end