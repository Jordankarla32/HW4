class EntriesController < ApplicationController
  before_action :require_login

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      redirect_to place_path(@entry.place_id), notice: "Entry created successfully"
    else
      render :new
    end
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :description, :occurred_on, :image, :place_id)
    end

    def require_login
      unless current_user
        redirect_to login_path, alert: "Please log in to continue."
      end
    end
end
