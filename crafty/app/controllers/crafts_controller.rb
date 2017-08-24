class CraftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @crafts = Craft.all
    @ordered_crafts = @crafts.sort_by { |f| f['title'].upcase }
  end

  def new
    @craft = Craft.new
  end

  def create
    @user = User.find(params[:user_id])
    @craft = @user.crafts.build(craft_params)
    if @craft.save
      redirect_to user_craft_path(current_user, @craft), notice: "Craft successfully created!"
    else
      redirect_to new_user_craft_path(current_user), alert: @craft.errors.full_messages.each { |err| err }.join(". ")
    end
  end

  def edit
    @craft = Craft.find(params[:id])
    redirect_if_not_author
  end

  def update
    @craft = Craft.find(params[:id])
    redirect_if_not_author
    if @craft.update(craft_params)
      redirect_to user_craft_path(current_user, @craft), notice: "Craft successfully updated!"
    else
      redirect_to edit_user_craft_path(current_user, @craft), alert: @craft.errors.full_messages.each { |err| err }.join(". ")
    end
  end

  def show
    @craft = Craft.find_by(id: params[:id])
    @ordered_tags = @craft.tags.sort_by { |f| f['name'].downcase }
  end

  private
    def craft_params
      params.require(:craft).permit(:title, :difficulty, :description, :instructions, :picture_url, :tag_ids => [], :tags_attributes => [:name])
    end
end
