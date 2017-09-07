class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @ordered_crafts = @user.crafts.sort_by { |f| f['title'].upcase }
  end
end
