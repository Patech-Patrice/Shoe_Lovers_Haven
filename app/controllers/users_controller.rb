require "erb"
class UsersController < ApplicationController

get '/signup' do
  #if !logged_in?
       erb :'users/signup'
    #else
      #redirect to
    end
#end

post '/signup' do
  #if params[:name] == "" || params[:email] == "" || params[:password] == ""
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      #valid input
       @user = User.new(name: params[:name], email: params[:email], password: params[:password])
       @user.save
       #binding.pry
       session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"

  else
    #shows not valid input
    #good UX would be to show a message to the user giving them an error
    redirect to '/signup'
  end
end


get '/login' do
  erb :login
end

#this route receives the login form
post '/login' do
 # Find the user
   @user = User.find_by(:email => params[:email])
   #Authenticate the user
   if @user && @user.authenticate(params[:password])
     # if authentication is validated, log the user in(create session)
     session[:user_id] = @user.id #logs the user in
     # redirect to the user's show page
     #puts session
     redirect to "/users/#{@user.id}"
   else
     #tell the user they entered invalid credentials
     # redirect user to login page
     #give user an error that login was incorrect
     redirect to '/login'
   end
 end

# user SHOW route
  get '/users/:id' do
    @user = User.find_by(id: params[:id])

    erb :'users/show'
  end

  get '/logout' do
    #if logged_in?
    session.clear
    redirect '/'
  end
end
