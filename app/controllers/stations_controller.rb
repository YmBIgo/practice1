class StationsController < ApplicationController
  def show
    @station = Station.find(params[:id])
    @user = @station.users
    @wear_all = Wear.where(:user_id => @station.users ).order("created_at DESC")
    @wears = @wear_all.page(params[:page]).per(20)
  end
end
