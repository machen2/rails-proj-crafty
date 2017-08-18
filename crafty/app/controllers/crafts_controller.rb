class CraftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @crafts = Craft.all
  end

  def new
    @craft = Craft.new
  end

  def create
    @craft = current_user.crafts.new(craft_params)
    if @craft.save
      redirect_to crafts_path
    else
      render new_craft_path
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
