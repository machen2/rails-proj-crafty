class RegistrationsController < ApplicationController
  def new
    @user = User.new
    #load a form for a User object
  end

  def create
    @user = User.new
  end
end
