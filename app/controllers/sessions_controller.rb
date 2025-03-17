# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # Login form
  end

  def create
    # Find user by email
    user = User.find_by(email: params[:email])
    
    # If user exists and password is correct
    if user && user.authenticate(params[:password])
      # Store user id in session
      session[:user_id] = user.id
      redirect_to places_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    # Clear the session
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end
end