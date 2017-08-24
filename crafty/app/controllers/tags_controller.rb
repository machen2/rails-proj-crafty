class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = Tag.all
    @ordered = @tags.sort_by { |f| f['name'].downcase }
  end

  def show
    @tag = Tag.find(params[:id])
    @ordered_crafts = @tag.crafts.sort_by { |f| f['title'].upcase}
  end
end
