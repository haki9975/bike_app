require './config/environment'

class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") } #tells controller where views is
 # configure do
  #  set :public_folder, 'public'
 #   set :views, 'app/views'
 # end

  get "/" do
    "hello world"
    erb :index
    #call erb file here
  end

end