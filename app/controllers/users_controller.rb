class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @wear_all = @user.wears.all
    @wears = @wear_all.page(params[:page]).per(20)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(update_params)
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless @user.id==current_user.id
  end

  def update_params
    params.require(:user).permit(:family_name,:first_name)
  end

end
