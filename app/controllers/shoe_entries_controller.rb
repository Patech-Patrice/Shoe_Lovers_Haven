class ShoeEntriesController < ApplicationController

  #index route for all shoe entries
  get '/shoe_entries' do
    @shoe_entries = ShoeEntry.all
    erb :'shoe_entries/index'
  end

  #creates new shoe
  get '/shoe_entries/new' do
    erb :'/shoe_entries/new'
  end

  # post request to create a new shoe entry and save it to the database
  # only want to save entries with content
  # only create an entry if the user is logged in
  post '/shoe_entries' do
    if !logged_in? && params[:name] != ""
      redirect '/'
    else
        #create a new entry
        @shoe_entry = ShoeEntry.create(name: params[:name], brand: params[:brand], url: params[:url], style: params[:style], user_id: current_user.id)
        flash[:message] = "Entry successfully created!"
        redirect to "/shoe_entries/#{@shoe_entry.id}"
    end
      redirect to '/shoe_entries/new'
  end
#flash messages must end in redirects


  #show route shoe entry; dynamic route
  get '/shoe_entries/:id' do
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
  erb :'shoe_entries/show'
  end

  get '/shoe_entries/:id/edit' do #loads the edit form
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
    if logged_in?
    if @shoe_entry.user == current_user
        erb :'/shoe_entries/edit'
      else
      redirect "users/#{current_user.id}"
    end
  else
  redirect '/'
 end
end


  # edit action
  patch '/shoe_entries/:id' do
    #find the shoe entry
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
    if logged_in? && @shoe_entry.user == current_user
        #modify(update) the shoe entry
        @shoe_entry.update(name: params[:name], brand: params[:brand], style: params[:style], url: params[:url])
      flash[:message] = "Entry successfully edited!"
      redirect "/shoe_entries/#{params[:id]}"
    else
      redirect "/users/#{current_user.id}/show"
    end
    redirect '/'
  end


  delete '/shoe_entries/:id/delete' do
    @shoe_entry = ShoeEntry.find_by(id: params[:id])
      if logged_in? && @shoe_entry.user.id == current_user.id
      #delete the entry
      @shoe_entry.destroy
      flash[:message] = "Entry successfully deleted."
      redirect '/shoe_entries'
    else
      redirect '/shoe_entries'
end
end
end
