class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new
    genre.update(require_params(:name))
    redirect_to genre_path(genre)
  end

  def edit
    @genre = Genre.find_by_id(params[:id])
  end

  def update
    genre = Genre.find_by_id(params[:id])
    genre.update(require_params(:name))
    redirect_to genre_path(genre)
  end

  private 

  def require_params(*args)
    params.require(:genre).permit(*args)
  end
end
