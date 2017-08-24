class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @ordered_crafts = current_user.crafts.sort_by { |f| f['title'].upcase}
  end
end
