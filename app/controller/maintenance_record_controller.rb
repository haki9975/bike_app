class MaintenanceRecordController < ApplicationController

    get '/maintenance_records' do
        redirect_if_not_logged_in

        @mrecords = current_user.maintenance_records

        erb :'maintenance_records/index'
    end

 
    get '/maintenance_records/new' do
        redirect_if_not_logged_in
        erb :'maintenance_records/new'
    end


    get '/maintenance_records/:id' do
        redirect_if_not_logged_in
        #binding.pry
        @mrecords = current_user.maintenance_records.find_by_id(params[:id])
   #     redirect_if_not_authorized
        erb :'maintenance_records/show'
    end


    post '/maintenance_records' do
        redirect_if_not_logged_in

        mrecords = MaintenanceRecord.new(params[:mrecords])
       # binding.pry
       # if bike.user_id == nil
      #  mrecords.bike_id  = select bike from drop down menu   <<<<<< Need to assign bike id to mrecord

        if mrecords.save 
            redirect "/maintenance_records/#{mrecords.id}"
        else
            redirect "/maintenance_records/new" 
        end
    end


    get '/maintenance_records/:id/edit' do
        redirect_if_not_logged_in
    #    redirect_if_not_authorized
        erb :'maintenance_records/edit'
    end


    patch '/maintenance_records/:id' do
        redirect_if_not_logged_in
       # redirect_if_not_authorized not working,
        
        @mrecords.update_attributes(params[:mrecords])

        if @mrecords.save
            redirect "/maintenance_records/#{mrecords.id}"
        else
            redirect "/maintenance_records/:id/edit"
        end

    end


    delete '/maintenance_records/:id' do
        redirect_if_not_logged_in
      #  redirect_if_not_authorized
        @mrecords.destroy

        redirect "/maintenance_records"
    end

    private
    
        def redirect_if_not_authorized
            @mrecords = MaintenanceRecord.find_by_id(params[:id])
            if @mrecords.user_id != session["user_id"]
                redirect "/bikes"
            end
        end


    
end