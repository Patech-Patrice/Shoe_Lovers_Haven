class ShoeEntriesController < ApplicationController

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

  #index route for all shoe entries

end
