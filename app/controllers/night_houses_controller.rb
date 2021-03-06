class NightHousesController < ApplicationController
  before_action :set_night_house, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_nh, only: [:edit, :update]
  before_action :correct_nh,   only: [:edit, :update]

  # GET /night_houses
  # GET /night_houses.json
  def index
    @night_houses = NightHouse.paginate(page: params[:page], per_page: 10)
  end

  # GET /night_houses/1
  # GET /night_houses/1.json
  def show
    @nightHouse =  NightHouse.find(params[:id])
    @parties = @nightHouse.parties.paginate(page: params[:page])
  end

  # GET /night_houses/new
  def new
    @night_house = NightHouse.new
  end

  # GET /night_houses/1/edit
  def edit
  end

  # POST /night_houses
  # POST /night_houses.json
  def create
    @nightHouse = NightHouse.new(night_house_params)
    if @nightHouse.save
      nhlog_in @nightHouse
      flash[:success] = "Bem-vindo!"
      redirect_to @nightHouse
    else
      render 'new'
    end
  end

  # PATCH/PUT /night_houses/1
  # PATCH/PUT /night_houses/1.json
  def update
    respond_to do |format|
      if @night_house.update(night_house_params)
        format.html { redirect_to @night_house, notice: 'Night house was successfully updated.' }
        format.json { render :show, status: :ok, location: @night_house }
      else
        format.html { render :edit }
        format.json { render json: @night_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /night_houses/1
  # DELETE /night_houses/1.json
  def destroy
    @night_house.destroy
    respond_to do |format|
      format.html { redirect_to night_houses_url, notice: 'Night house was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_night_house
      @night_house = NightHouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def night_house_params
      params.require(:night_house).permit(:name, :cnpj, :email, :category, :state, :city, :neighbourhood, :address, :password, :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_nh
      unless nhlogged_in?
        flash[:danger] = "Por favor, faça login."
        redirect_to loginnh_url
      end
    end

    def correct_nh
      @night_house = NightHouse.find(params[:id])
      redirect_to(root_url) unless @night_house == current_nh
    end
end
