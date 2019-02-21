class ArtistsController < ApplicationController
  get '/artists/new' do
    erb :'artists/new'
  end

  post '/artists' do
    @artist = Artist.new(params)

    if @artist.save
      redirect to "/artists/#{@artist.id}"
    else
      erb :'artists/new'
    end
  end

  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :'artists/show'
  end
end
