class MaintenanceRecordController < ApplicationController
    #Read all records ***this works!***
        get '/maintenance_records/' do
            @mrecords = MaintenanceRecord.all
            erb :'maintenance_records/index'
        end

    #Create new record (render form) ***This works!*** Add edit button and more paramaters
        get '/maintenance_records/new/' do
            erb :'maintenance_records/new'
        end

    #Read one record ***This works!***
        get '/maintenance_records/:id/' do
            @mrecords = MaintenanceRecord.find_by_id(params[:id])
            erb :'maintenance_records/show'
        end

    #Create new record (save in db) ***This seems to be working!***
        post '/maintenance_records/' do
           mrecords = MaintenanceRecord.new(name: params["name"])
           if mrecords.save 
                redirect "/maintenance_records/#{mrecords.id}"
           else
            "Error, didn't save" # can "redirect "/movies/new" <--- redirects to path
           end
        end

    #Update one record (render form) ***This is not working***
        get '/maintenance_records/:id/edit' do
            @mrecords = MaintenanceRecord.find_by_id(params[:id])
            erb :'maintenance_records/edit'
        end
    #Update one record (save in db)
        patch '/maintenance_records/:id/' do
            mrecords = MaintenanceRecord.find_by_id(params[:id])
            mrecords.name = params["title"]
            if mrecord.save
                redirect '/maintenance_records/"#{mrecord.id}"'
            else
                redirect 'maintenance_records/:id/edit'
            end

        end

    #Delete one movie ***Not working yet***
        delete 'maintenance_records/:id' do
           mrecords = MaintenanceRecord.find_by_id(params[:id])
           mrecords.destroy

           redirect "/maintenance_records/"
        end

end