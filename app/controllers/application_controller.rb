#require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    "Hello World!"
  end

  get '/login' do
    erb :index
  end




  #get '/patrices-favorite-shoe' do
    #{}"Christian Louboutin Pink Pigalle Follies"
#  end

  #get '/show-new-shoe' do
    #Shoe.create!(name: "Pigalle Follies", brand: "Christian Louboutin", style: "Heel" )


# end

end
