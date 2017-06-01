class StaticController < ApplicationController

  def static
    file = request.path == "/" ? :map : params[:file_name]
    send(file) if respond_to? file
    render file
  end

  def map
    @routes = Route.all
    @geo_points = GeoPoint.where.not(name: nil)
    gon.jbuilder template: 'app/views/json/routes.json.jbuilder'
  end

  def places
    @slug = params[:slug] || "san_francisco"
  end

end
