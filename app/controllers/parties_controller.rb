class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  def index
    @parties = Party.paginate(page: params[:page], per_page: 10)
  end

  def show
    @checkin = Checkin.new
    @photo = Photo.new
    @video = Video.new
    @photos = Photo.where(party_id: @party.id)
    @videos = Video.where(party_id: @party.id)
  end

  def new
    @party = Party.new
  end

  def edit
  end

  def create
    @party = current_nh.parties.build(party_params)
    puts @party.picture
    if @party.save
      flash[:success] = "Festa criada!"
      redirect_to @party
    else
      # redirect_to newparty_path
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:name, :category, :addinfo, :musicstyle, :partydate, :partytime, :picture)
    end
end
