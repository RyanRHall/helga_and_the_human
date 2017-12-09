class GeoPointsController < ApplicationController

  def new
    @geo_point = GeoPoint.new
  end

  def edit
    @geo_point = GeoPoint.find(params[:id])
  end

  def create
    geo_point = GeoPoint.new(geo_point_params)
    if geo_point.save
      redirect_to root_path
    else
      flash[:errors] = geo_point.errors.full_messages
      redirect_to new_geo_point_path
    end
  end

  def update
    geo_point = GeoPoint.find(params[:id])
    geo_point.assign_attributes(geo_point_params)
    if geo_point.save
      redirect_to photos_by_tag_path(geo_point.slug)
    else
      flash[:errors] = geo_point.errors.full_messages
      redirect_to edit_geo_point_path
    end
  end

  def destroy
    GeoPoint.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def geo_point_params
    params.require(:geo_point).permit(:name, :slug, :lat, :lng)
  end

end
