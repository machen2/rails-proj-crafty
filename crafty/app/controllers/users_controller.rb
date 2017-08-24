class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    if current_user.id == @user.id
      @ordered_crafts = current_user.crafts.sort_by { |f| f['title'].upcase }
    else
      redirect_to crafts_path, alert: "You do not have access to that page."
    end
  end
end
