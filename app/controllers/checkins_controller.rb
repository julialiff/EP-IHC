class CheckinsController < ApplicationController
  def new
    @checkin = Checkin.new
  end

  def create
    @party_id = params[:party_id]
    @user_id = params[:user_id]
    @checkin = Checkin.new(checkin_params)
    @party = Party.find(@party_id)
    puts @checkin
    if @checkin.save
      flash[:success] = "Check-in realizado!"
      redirect_to @party
    else
      redirect_to "parties/#{@party_id}"
    end
  end

  private

  def checkin_params
    params.permit(:user_id, :party_id)
  end
end
