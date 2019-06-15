class AlbumsController < ApplicationController
  def index
    #code
    @albums = Album.all
  end
  def show
    #code
    @albums = Album.find(params[:id])
    @tracks = @albums.tracks
  end
end
