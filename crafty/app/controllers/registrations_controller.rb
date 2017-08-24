class RegistrationsController < ApplicationController
  def new
    if is_logged_in?
      redirect_to crafts_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to crafts_path
    else
      render "registrations/new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
