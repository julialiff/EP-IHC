class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.json { render json: @locations }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Bem-vindo ao PartyFinder!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :cellphone, :birthdate, :occupation, :college, :state, :city,
                                   :neighbourhood, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

     # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
