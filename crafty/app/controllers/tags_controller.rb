class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = Tag.all
    @ordered = @tags.sort_by { |f| f['name'].downcase }
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
