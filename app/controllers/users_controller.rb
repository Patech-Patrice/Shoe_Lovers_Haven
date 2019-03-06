class UsersController < ApplicationController

#login route renders the login form

get '/login' do
  #if !logged_in?
   erb :login
  #else
    #redirect to '/shoes'
#  end
end
#this route receives the login form
#finds the user and logs user in(create a session)
post '/login' do
  binding.pry
   #user = User.find_by(:email => params[:email])
   #if user && user.authenticate(params[:password])
     #session[:user_id] = user.id
     #redirect '/shoes'
   #else
     #redirect to '/signup'
   #end
 end


#logout
#get '/logout' do
  #if logged_in?
    #session.destroy
    #redirect to '/login'
  #else
    #redirect to '/'
  #end
#end

#signup

get '/signup' do
  
  end

  #post '/signup' do
    #if params[:name] == "" || params[:email] == "" || params[:password] == ""
      #redirect to '/signup'
    #else
      #@user = User.new(name: params[:name], email: params[:email], password: params[:password])
    #  @user.save
      #session[:user_id] = @user.id
      #redirect to '/shoes'
    #end
  #end




end
