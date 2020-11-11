class SongsController < ApplicationController
  
  def index
        @songs = Song.all
    end

    def show
        find
    end

    def new
        @song = Song.new
    end

    def edit
        find
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def update
        if find.update(song_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        find.destroy
        redirect_to songs_url
    end

    private

    def find
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
