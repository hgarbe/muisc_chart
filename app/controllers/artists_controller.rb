class ArtistsController < ApplicationController
  # before_action :set_billboard
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  
  def index
    @artists = Artist.all
  end


  def show
    # @songs = @artist.songs.all
  end

  def new
    @artist = Artist.new
    # render partial: "form"
  end

  def create
    @artist = Artist.new(artist_params)
    puts @artist
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
  	if @artist.update(artist_params)
  		redirect_to artists_path
  	else
  		render :edit
  	end
  end

  def destroy
    @artist.destroy
    redirect_to artists_url
  end
  
  private

  # def set_billboard
  #   @billboard = Billboard.find(params[:billboard_id])
  # end  

  def set_artist
  	@artist = Artist.find(params[:id])
  end

  def artist_params
  	params.require(:artist).permit(:name)
  end

end
