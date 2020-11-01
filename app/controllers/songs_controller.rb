class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new
  end

  def create
  end

  def edit
    find_song
  end

  def update
    find_song
  end

  def delete
    find_song
  end

  private

  def find_song
    @song = Song.find_by(params[:id])
  end
end
