class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @party_id = params[:party_id]
    @user_id = params[:user_id]
    @pic = params[:photo]
    ap params[:photo]


    # @photo = Photo.new(photo_params)
    @photo = Photo.new
    @photo.party_id = @party_id
    @photo.user_id = @user_id
    @photo.pic = params[:photo][:pic]
    # puts '***********************'
    # puts @party_id
    # puts '------------------------'
    # puts @user_id
    # puts '------------------------'
    # ap params[:photo]
    # puts '######'
    # ap params[:photo][:pic]
    # puts '------------------------'
    # puts @photo
    # puts '***********************'

    @party = Party.find(@party_id)
    puts @party
    if @photo.save
      flash[:success] = "Foto upada!"
      redirect_to @party
    else
      redirect_to "parties/#{@party_id}"
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:user_id, :party_id, :pic)
  end
end
