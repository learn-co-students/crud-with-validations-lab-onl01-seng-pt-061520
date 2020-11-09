class SongsController < ApplicationController
    before_action :current_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params(:title, :release_year, :released, :artist_name, :genre))
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        if @song.update(song_params(:title, :release_year, :released, :artist_name, :genre))
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def current_song
        @song = Song.find_by_id(params[:id])
    end
end
