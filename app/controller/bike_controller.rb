class BikeController < ApplicationController
    #Read all records
        get '/bikes/' do
            @bike = Bike.all
            erb :'bikes/index'
        end

    #Create new record (render form)
        get '/maintenance_records/new' do
            erb :'maintenance_records/new'
        end

    #Read one record
        get '/maintenance_records/:id' do
            @mrecords = MaintenanceRecord.find_by_id(params[:id])
            erb :'maintenance_records/show'
        end

    #Create new record (save in db)
        post '/maintenance_records/' do
           mrecords = MaintenanceRecord.new(name: params["name"])
           if mrecords.save 
                redirect "/maintenance_records/#{mrecords.id}"
           else
            "Error, didn't save" # can "redirect "/movies/new" <--- redirects to path
           end
        end

    #Update one record (render form)
        get '/maintenance_records/:id/edit/' do
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

    #Delete one movie
        delete 'maintenance_records/:id' do
           mrecords = MaintenanceRecord.find_by_id(params[:id])
           mrecords.destroy

           redirect "/maintenance_records"
        end

end