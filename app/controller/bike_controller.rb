class BikeController < ApplicationController
    #Read all records ***this works!***
        get '/bikes' do
            @bikes = BikeController.all
            erb :'bikes/index'
        end

    #Create new record (render form) ***This works!*** 
        get '/bikes/new' do
            erb :'bikes/new'
        end

    #Read one record ***This works!***
        get '/bikes/:id' do
            @bikes = BikeController.find_by_id(params[:id])
              erb :'bikes/show'
        end

    #Create new record (save in db) ***This seems to be working!***
        post '/bikes' do
           bikes = BikeController.new(params[:bikes])
           if bikes.save 
                redirect "/bikes/#{bikes.id}"
           else
                redirect "/bikes/new" 
           end
        end

    #Update one record (render form) ***This is working!!!***
        get '/bikes/:id/edit' do
            @bikes = BikeController.find_by_id(params[:id])
             erb :'bikes/edit'
        end


    #Update one record (save in db) ***This is working!!!***
        patch '/bikes/:id' do
            bikes = BikeController.find_by_id(params[:id])
            #binding.pry
            bikes.update_attributes(params[:bikes])
            if bikes.save
                redirect "/bikes/#{bikes.id}"
            else
                redirect "/bikes/:id/edit"
            end

        end

    #Delete one movie ***Not working yet***
        delete '/bikes/:id' do
           bikes = BikeController.find_by_id(params[:id])
           #binding.pry
           #bikes.destroy
            if bikes.destroy
              redirect "/bikes"
            else
              redirect "/bikes/#{bikes.id}"
            end
        end

end