class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    # Only show entries for the current user
    @entries = current_user.entries.where(place_id: @place.id)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path, notice: "Place added successfully"
    else
      render :new
    end
  end

  private

    def place_params
      params.require(:place).permit(:name, :description)
    end

    def require_login
      unless current_user
        redirect_to login_path, alert: "Please log in first."
      end
    end
end
