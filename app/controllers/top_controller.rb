class TopController < ApplicationController
  def index
    @wear_all = Wear.all
    @wears = @wear_all.page(params[:page]).per(20)
  end
end