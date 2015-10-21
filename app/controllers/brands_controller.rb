class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @wear_all = Wear.where(:brand_id => @brand.id).order("created_at DESC")
    @wears = @wear_all.page(params[:page]).per(20)
  end
end
