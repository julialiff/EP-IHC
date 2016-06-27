class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @party_id = params[:party_id]
    @user_id = params[:user_id]
    @yturl = url_id(params[:video][:yturl])
    @video = Video.new
    @video.party_id = @party_id
    @video.user_id = @user_id
    @video.yturl = @yturl
    @party = Party.find(@party_id)
    if @video.save
      flash[:success] = "Vídeo enviado!"
      redirect_to @party
    else
      redirect_to "parties/#{@party_id}"
    end
  end

  private

  def video_params
    params.permit(:user_id, :party_id, :yturl)
  end

  def url_id(yturl)
    id = yturl.split('v=').last
    if id.include? '&'
      return id.split('&').first
    else
      return id
    end
  end
end
