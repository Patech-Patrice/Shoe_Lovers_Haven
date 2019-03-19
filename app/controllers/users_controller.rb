class UsersController < ApplicationController

get '/signup' do
       erb :'users/signup'
    end


post '/signup' do
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      #valid input
       @user = User.new(name: params[:name], email: params[:email], password: params[:password])
       @user.save
       session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"
  else
    #shows not valid input
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
     redirect to "/users/#{@user.id}"
   else
     flash[:message] = "Your credentials are invalid. Please create an account or try again."
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
    session.clear
    redirect '/'
  end
end
