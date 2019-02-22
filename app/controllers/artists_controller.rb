class ArtistsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  
  def index
  	@artists = @billboard.artists.new
  end


  def show
  end

  def new
    @artist = @billboard.artists.new
    render partial: "form"
  end

  def create
  	@artist = @billboard.artists.new(artist_params)
  	if @artist.save
  		redirect_to billboard_artists_path
  	else
  		render :new
  	end
  end

  def edit
    render partial: "form"
  end

  def update
  	if @artist.update(artist_params)
  		redirect_to [@billboard, @artist]
  	else
  		render :edit
  	end
  end

  def destroy
  	@artist.destroy
  	redirect_to [@billboard, @artist]
  end
 
  private

  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end  

  def set_artist
  	@artist = Artist.find(params[:id])
  end

  def artist_params
  	params.require(:artist).permit(:name, :genre)
  end

end