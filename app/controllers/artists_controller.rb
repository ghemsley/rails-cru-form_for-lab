class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find_by_id(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new
    artist.update(require_params(:name, :bio))
    redirect_to artist_path(artist)
  end

  def edit
    @artist = Artist.find_by_id(params[:id])
  end

  def update
    artist = Artist.find_by_id(params[:id])
    artist.update(require_params(:name, :bio))
    redirect_to artist_path(artist)
  end

  private
  
  def require_params(*args)
    params.require(:artist).permit(*args)
  end
end
