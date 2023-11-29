class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def new
    @band = Band.new
    render :new
  end

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    redirect_to band_url(@band)
  end

  def edit
    render :edit
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def update
    if @band.update
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    @band.destroy
    redirect_to bands_url
  end




  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end



end
