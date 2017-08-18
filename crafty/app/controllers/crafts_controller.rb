class CraftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @crafts = Craft.all
  end

  def new
    @craft = Craft.new
  end

  def create
    @craft = Craft.new(craft_params)
    if @craft.save
      redirect_to crafts_path
    else
      redirect_to new_craft_path
    end
  end

  private
    def craft_params
      params.require(:craft).permit(:title, :difficulty, :description, :instructions)
    end
end
