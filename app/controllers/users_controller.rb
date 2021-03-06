class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @wear_all = @user.wears.all
    @wears = @wear_all.page(params[:page]).per(20)
    @station = @user.station
    @ward = @user.ward
  end

  def edit
    @user = User.find(params[:id])
    @wards = Ward.all
    if current_user.ward!=nil
      @ward = current_user.ward
    else
      @ward = Ward.first
    end
  end

  def update
    current_user.update(update_params)
  end

  def stations_select
    if request.xhr?
      render partial: 'stations', locals: { ward_id: params[:ward_id]}
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless @user.id==current_user.id
  end

  def update_params
    params.require(:user).permit(:family_name,:first_name, :ward_id, :station_id)
  end

end
