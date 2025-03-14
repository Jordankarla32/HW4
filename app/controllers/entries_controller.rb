class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.place_id = params[:place_id]

    if @entry.save
      redirect_to place_path(@entry.place_id), notice: "Entry added successfully!"
    else
      flash[:alert] = "Error: Could not save entry."
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end
end
