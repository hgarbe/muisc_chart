class SongsController < ApplicationController
    # before_action :set_billboard
    before_action :set_artist
    before_action :set_song , only: [:show, :edit, :update]

    def index
      @songs = @artist.songs.new
    end
  
  
    def show
    end
  
    def new
      @song = @artist.songs.new
      render partial: "form"
    end
  
    def create
      @song = @artist.songs.new(song_params)
      if @song.save
        redirect_to artist_songs_path
      else
        render :new
      end
    end
  
    def edit
      render partial: "form"
    end
  
    def update
      if @song.update(song_params)
        redirect_to artist_songs_path
      else
        render :edit
      end
    end
  
    def destroy
      @song.destroy
      redirect_to songs_path
    end
  
    private
  
    # def set_billboard
    #   @billboard = Billboard.find(params[:billboard_id])
    # end  
  
    def song_params
      params.require(:song).permit(:name, :artist_id)
    end
  
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
  
    def set_song
      @song = Song.find(params[:id])
    end
  end
  
