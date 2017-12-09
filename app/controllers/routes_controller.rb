class RoutesController < ApplicationController

  before_action :redirect_if_unauthorized!

  def index
    routes = Route.all.preload(:geo_points)
    @slugs = routes.map { |route| route.geo_points.first.slug }
    @slugs << routes.last.geo_points.last.slug
  end

  def mass_update
    @slugs = params[:slugs]
    valid_slugs = geo_points.map(&:slug)
    invalid_slugs = @slugs - valid_slugs
    if invalid_slugs.present?
      flash.now[:errors] = "Invalid slugs: #{invalid_slugs.join(', ')}"
      render :index
    else
      Route.destroy_all
      route_slugs = @slugs[0..-2].map.with_index { |slug, idx| [slug, @slugs[idx + 1]] }
      route_geo_points = route_slugs.each do |slugs|
        slugs.map! { |slug| geo_points.find { |geo_point| geo_point.slug == slug } }
      end
      route_geo_points.each { |geo_points| Route.create!(geo_points: geo_points) }
      redirect_to root_url
    end
  end

  private

  def geo_points
    @geo_points ||= GeoPoint.all
  end

end
