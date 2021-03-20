require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs= Song.all
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    @genres= Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    @song= Song.create(params[:song])
    @song.artist= Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    redirect to "/songs/#{@song.id}"
  end

  get '/songs/:id/edit' do
    @song= Song.find_by_id(params[:id])
    @genres= Genre.all
    erb :'/songs/edit'
  end

  get '/songs/:id' do
    @song= Song.find(params[:id])
    erb :'/songs/show'
  end

  patch '/songs/:id' do
    binding.pry
    @song= Song.find_by_id(params[:id])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    
    #@song.genre_ids.clear
    #@song.genre_ids= params[:song][:genre_ids]
    #@genres= Genre.find(params[:song][:genre_ids])

    # @genres.each do |genre|
    #   song_genre= SongGenre.new(song: @song, genre: genre)
    #   song_genre.save
    # end
    
    @song.save
    redirect to "songs/#{@song.id}"
    
  end


end