class ShoeEntriesController < ApplicationController

  #index route for all shoe entries
  get '/shoe_entries' do
    @shoe_entries = ShoeEntry.all
    erb :'shoe_entries/index'
  end

  #show user list of shoes
  get '/shoe_entries/new' do
    #"Here we will show the user their shoes"
    erb :'/shoe_entries/new'
  end

  # post request to create a new shoe entry and save it to the database
  # only want to save entries with content
  # only create an entry if the user is logged in
  post '/shoe_entries' do
    if !logged_in?
      redirect '/'
    end
    #Only show entries with content
      if params[:name] != "" && params[:brand_id] != "" && params[:style_id] != ""
        #create a new entry
        @shoe_entry = ShoeEntry.create(name: params[:name], brand_id: params[:brand_id], style_id: params[:style_id], user_id: current_user.id)
        redirect to "/shoe_entries/#{@shoe_entry.id}"
    else
      redirect to '/shoe_entries/new'
  end
end


  #show route shoe entry
  get '/shoe_entries/:id' do
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
  erb :'shoe_entries/show'
  end

  get '/shoe_entries/:id/edit' do
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
    if logged_in?
        erb :'/shoe_entries/edit'
      else
      redirect '/'
  end
end


  patch '/shoe_entries/:id' do
    #find the shoe entry
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
    if logged_in?
      if @shoe_entry.user == current_user
        #modify(update) the shoe entry
        @shoe_entry.update(name: params[:name], brand_id: params[:brand_id], style_id: params[:style_id])
      redirect "/shoe_entries/#{current_user.id}/edit"
    else
      redirect "users/#{current_user.id}"
    end
  else
    redirect '/'
  end
end

  delete '/shoe_entries/:id/delete' do
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
      #delete the entry
      @shoe_entry.destroy
      #flash message that item was successfully deleted
      #go somewhere
      redirect '/shoe_entries/new'
      #go somewhere else not delete
end
end
