# app/controllers/places_controller.rb
class PlacesController < ApplicationController
  before_action :require_login, except: [:index]
  
  def index
    @places = Place.all
  end
  
# app/controllers/places_controller.rb
def show
  @place = Place.find(params[:id])
  
  # This is the important part - only show entries for the current user
  if current_user
    @entries = @place.entries.where(user_id: current_user.id)
  else
    @entries = []
  end
end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(place_params)
    
    if @place.save
      redirect_to places_path, notice: "Place created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def place_params
    # Check if place params exist, otherwise build them from the root params
    if params[:place].present?
      params.require(:place).permit(:name)
    else
      params.permit(:name)
    end
  end
  
  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end