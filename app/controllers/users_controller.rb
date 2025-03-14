class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["email"] = params["email"]
    @user["password"] = params["password"]

    if @user.save
      session[:user_id] = @user.id
      redirect_to "/", notice: "Signed up successfully!"
    else
      flash[:alert] = "Error: Could not create account."
      render :new
    end
  end
end
