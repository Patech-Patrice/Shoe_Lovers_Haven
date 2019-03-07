require "erb"
class UsersController < ApplicationController

#login route renders the login form

get '/signup' do
  #if !logged_in?
       erb :'users/signup'
    #else
      #redirect to '/show'
    end
#end

post '/signup' do
  #if params[:name] == "" || params[:email] == "" || params[:password] == ""
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      #valid input
       @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    redirect to '/users/show'

  else
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      @user.save
    session[:user_id] = @user.id
    #redirect to '/users/show'
  end
end


get '/login' do
  #if !logged_in?
   erb :login
  #else
    #redirect to '/shoes'
#  end
end

#this route receives the login form
post '/login' do
  # params looks like: {email: "user@user.com", password: "password"}
   # Find the user
   user = User.find_by(:email => params[:email])
   #Authenticate the user
   if user && user.authenticate(params[:password])
     # if authentication is validated, log the user in(create session)
     session[:user_id] = user.id
     # redirect to the user's show page
     #puts session
     redirect '/show'
   else
     #tell the user they entered invalid credentials
     # redirect user to login page
     redirect to '/login'
   end
 end


# user SHOW route
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'users/show'
  end
end
