class GenresController < ApplicationController

  get '/genres' do
    @artists= Artist.all
    erb :'artists/index'
  end

  get '/genres/:id' do
    @genre = Genre.find_by_id(params[:id])
    erb :'genres/show'
  end

end
