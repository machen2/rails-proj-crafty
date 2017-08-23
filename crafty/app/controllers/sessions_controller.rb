class SessionsController < ApplicationController
  def new
    if is_logged_in?
      redirect_to crafts_path
    end
  end

  def create
    if auth.present?
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to crafts_path, notice: "Successfully logged in!"
    end

    if params[:email].present?
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to crafts_path, notice: "Successfully logged in!"
      else
        @user.nil? ? (flash[:error] = "Email is Invalid") : (flash[:error] = "Password is Invalid")
        render "sessions/new"
      end
    end
  end

  def destroy
    if is_logged_in?
      session.delete(:user_id)
      redirect_to root_path, notice: "Successfully logged out!"
    else
      redirect_to login_path
    end
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
