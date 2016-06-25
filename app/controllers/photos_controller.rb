class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @party_id = params[:party_id]
    @user_id = params[:user_id]
    @pic = params[:pic]

    @photo = Photo.new(photo_params)
    puts '***********************'
    puts @party_id
    puts '------------------------'
    puts @user_id
    puts '------------------------'
    puts @pic
    puts '------------------------'
    puts @photo
    puts '***********************'

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
    params.permit(:user_id, :party_id, :pic)
  end
end
