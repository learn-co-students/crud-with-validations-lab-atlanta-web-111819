class SongsController < ApplicationController
    def index
        @songs = Song.all 
    end

    def show
        select_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(post_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        select_song
    end

    def update
        select_song
        if @song.update(post_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        select_song
        @song.destroy
        redirect_to songs_path
    end

    private

    def select_song
        @song = Song.find(params[:id])
    end
    def post_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
