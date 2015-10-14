class WearsController < ApplicationController

  before_action :correct_user, only: [:new, :create, :edit, :update]
  def new
    @wear = Wear.new
  end

  def create
    @wear = Wear.create(create_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def create_params
    params.require(:wear).permit(:price)
  end

  def correct_user
    redirect_to(root_path) unless user_signed_in?
    flash[:error] = "ログインしてください"
  end

end
