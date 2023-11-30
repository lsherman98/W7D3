class AlbumsController < ApplicationController
    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to bands_url
        else
            # @album = Album.new()
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def edit
        @album = Album.new
        render :edit
    end

    def update
        @album = Album.find(params[:id])

        if @album.update
            redirect_to band_url(@album.band_id)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to band_url(@album.band_id)
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :live, :band_id)
    end
end
