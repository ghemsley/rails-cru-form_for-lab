class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by_id(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    song = Song.new
    song.update(require_params(:name, :artist_id, :genre_id))
    redirect_to song_path(song)
  end

  def edit
    @song = Song.find_by_id(params[:id])
  end

  def update
    song = Song.find_by_id(params[:id])
    song.update(require_params(:name, :artist_id, :genre_id))
    redirect_to song_path(song)
  end

  private 

  def require_params(*args)
    params.require(:song).permit(*args)
  end
end
