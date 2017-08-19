class CraftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @crafts = Craft.all
  end

  def new
    @craft = Craft.new
  end

  def create
    @user = User.find(params[:user_id])
    @craft = @user.crafts.build(craft_params)
    if @craft.save
      redirect_to user_craft_path(current_user, @craft)
    else
      render new_user_craft_path(current_user, @craft)
    end
  end

  def edit
    @craft = Craft.find_by(params[:id])
    redirect_if_not_author
  end

  def update
    @craft = Craft.find_by(params[:id])
    redirect_if_not_author
    if @craft.update(craft_params)
      redirect_to craft_path(@craft)
    else
      redirect_to edit_user_craft_path(current_user, @craft) #####
    end
  end

  def show
    @craft = Craft.find_by(id: params[:id])
  end

  private
    def craft_params
      params.require(:craft).permit(:title, :difficulty, :description, :instructions)
    end
end
