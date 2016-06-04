class NhsessionsController < ApplicationController
  def new
  end

  def create
     nightHouse = NightHouse.find_by(email: params[:nhsession][:email].downcase)
    if nightHouse && nightHouse.authenticate(params[:nhsession][:password])
      log_in_nh nightHouse
      redirect_to nightHouse
    else
      # Create an error message.
      flash.now[:danger] = 'E-mail ou senha inválidos'
      render 'new'
    end
  end

  def destroy
  end
end
