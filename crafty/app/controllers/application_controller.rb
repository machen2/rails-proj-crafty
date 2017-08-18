class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_logged_in?, :authenticate_user!

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def is_logged_in?
      !!current_user
    end

    def authenticate_user!
      redirect_to login_path if !is_logged_in? ##CHANGE TO LOGIN PATH
    end
end
