class SessionsController < ApplicationController
  def new
    if is_logged_in?
      redirect_to crafts_path
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to crafts_path
    else
      @user.nil? ? (flash[:error] = "Email is Invalid") : (flash[:error] = "Password is Invalid")
      render "sessions/new"
    end
  end

  def destroy
    if is_logged_in?
      session.delete(:user_id)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
end
