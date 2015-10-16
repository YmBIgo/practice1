class WearsController < ApplicationController

  before_action :correct_user, only: [:new, :create, :edit, :update]

  def new
    @wear = Wear.new
  end

  def create
    @wear = Wear.create(create_params)
  end

  def show
    @wear = Wear.find(params[:id])
    @user = @wear.user
  end

  def edit
    @wear = Wear.find(params[:id])
  end

  def update
    @wear = Wear.find(params[:id])
    @wear.update(update_params)
  end

  private

  def create_params
    params.require(:wear).permit(:price,:avatar,:user_id).merge(user_id: current_user.id)
  end

  def correct_user
    redirect_to(root_path) unless user_signed_in?
    flash[:error] = "ログインしてください"
  end

  def update_params
    params.require(:wear).permit(:price)
  end

end
