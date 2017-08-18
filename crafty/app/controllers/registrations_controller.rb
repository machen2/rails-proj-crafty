class RegistrationsController < ApplicationController
  def new
    @user = User.new
    #load a form for a User object
  end

  def create
    @user = User.new
    if @user.save
      session[:user_id] = @user.id
      redirect_to crafts_path
  end
end
