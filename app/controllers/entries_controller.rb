# app/controllers/entries_controller.rb
class EntriesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  
  def new
    @entry = Entry.new
    @place = Place.find(params[:place_id])
  end
  
  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id
    
    if @entry.save
      redirect_to place_path(@entry.place_id), notice: "Entry created successfully"
    else
      @place = Place.find(params[:entry][:place_id])
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :image)
  end
end