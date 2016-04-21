class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    if params[:id].nil? && current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @tasks = @user.tasks
  end
end
