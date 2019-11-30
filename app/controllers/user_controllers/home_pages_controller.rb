class UserControllers::HomePagesController < ApplicationController
  def index
  end

  def show
    @product= User.new
  end
end
