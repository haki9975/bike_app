require './config/environment'

class ApplicationController < Sinatra::Base
  #set :views, Proc.new { File.join(root, "../views") } #tells controller where views is
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    
    erb :index
  # You're going to want to put log in forms here, with the forms and buttons in :index.erb
  end

end